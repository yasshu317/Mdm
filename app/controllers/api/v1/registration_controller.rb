class Api::V1::RegistrationController < ApplicationController
  skip_before_filter :authenticate_user!

  def login
  	if params[:username].blank? || params[:password].blank?
  		render  :text => "{\"credentials\":invalid}" ,:status => 201
  	else
  		user = mobile_authenticate_user(params)
  		if user
        first_name = user.displayname.first.split(' ')[0]
        last_name = user.displayname.first.split(' ')[1]
        mobile_user = MobileUser.find_by_user_name(params[:username])
        if mobile_user.blank?
          mobile_user = MobileUser.new
        end
        mobile_user.user_name = params[:username]
        mobile_user.first_name = first_name
        mobile_user.last_name = last_name
        # mobile_user.dob = params[:dob]
        # mobile_user.gender = params[:gender]
        # mobile_user.employee_id = params[:employee_id]
        # mobile_user.mobile = params[:mobile]
        mobile_user.registration_id = params[:secretkey]
        if mobile_user.save!
          device = Device.find_by_imei(params[:imei])
          if device.blank?
      		  device = Device.new
          end
      		device.device_type = params[:ostype]
          device.device_model = params[:devicemodel]
      		device.capacity = params[:capacity]
      		device.serial_number = params[:secretkey]
      		device.version = params[:osversion]
      		device.supervised = params[:supervised]
          device.mobile_user_id = mobile_user.id
          device.imei = params[:imei]
      		if device.save!
            activity_log = ActivityLog.find_by_activity_and_status('Enroll Device', 'Succeeded')
            if activity_log.blank?
              activity_log = ActivityLog.new
              activity_log.activity = 'Enroll Device'
              activity_log.status = 'Succeeded'
              activity_log.mobile_user_id = mobile_user.id
              activity_log.save
            end
          end
        end
  		end
  	end
    render  :text => "{\"successful\":true}" ,:status => 200
  end

end