class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
  #   render :text => exception, :status => 500
  # end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def mobile_authenticate_user(params)
  	login = params[:username]
  	password = params[:password]
  	ldap = Net::LDAP.new  :host => "themis.corp.ads.valuelabs.net",
                      :port => "389",
                      :base => "dc=corp,dc=ads,dc=valuelabs,dc=net",
                      :auth => {
                      :method => :simple,
                      :username => "#{login}@corp.ads.valuelabs.net",
                      :password => "#{password}"
                    }
  	if ldap.bind 
      debug_log "Success"
  	  user = ldap.search(:filter => "sAMAccountName=#{login}").first
  	  user
  	else
  	  debug_log "false"
  	  return false
  	end
  end

  # when ever we are calling this method, please do remember we should initialize
  # @mobile_user in respective controller
  def build_json_for_android(profile)
      if profile
        @profile_json = {
        :resetPassword => @profile.set_password,
        :camera => @profile.camera,
        :network => [:gprs => @profile.gprs,:wifi => @profile.wifi],
        :wallPaper => @wallpaper,
        :ringTone => @ringtone,
        :emailAccess => @profile.email_access_id,
        :setCallDuration => @profile.default_call_duration,
        :deviceMode => device_mode(@profile.device_mode),
        :timeZone => @profile.timezone,
        :trackConversation => @profile.spy_recording,
        :passwordExpiry => [@profile.expiry],
        :internalSettings => @profile.internal_settings.map(&:name),
        :emailAccess => @profile.email_accesses.map(&:identifier)
      }

        # "inboxMessages":true,
        # "blockurl":[ 
        #     {"3":{"block":false,"url":"http:\/\/onemore1.net"},
        #      "2":{"block":true,"url":"http:\/\/another.net"},
        #      "1":{"block":false,"url":"http:\/\/myurl.net"},
        #      "4":{"block":false,"url":"http:\/\/onemore.net"}
        #      }],

      data = { :mdm => @profile_json.to_json }
      # Sending Info to GCM 
      puts 
      puts 'Notification sending to =====> ' + @mobile_user.user_name
      result = GCM.send_notification(@mobile_user.registration_id, data)
      if result.first[:body]['success'] == 1
        audit_activity_log(@mobile_user, @profile_json.to_json)
      end
    end
  end


  def device_mode(status)
    case status
      when 1
        'Ringing'
      when 2
        'Vibrate'
      else
        'Silent'
    end
  end

  def audit_activity_log (mobile_user, profile)
    activity_array = JSON.parse(profile)
    activity_array.each do |activity|
      activity_log = ActivityLog.new
      activity_log.activity = activity[0].humanize
      next if activity[1] == nil
      activity_log.status = set_activity_value(activity) 
      activity_log.mobile_user_id = mobile_user.id
      activity_log.save
    end
  end

  def set_activity_value(activity)
    case activity[1]
    when true
      'Enabled'
    when false
      'Disabled'
    when nil
      debug_log 'nilll'
    when 'Ringing'
      'Mode set to Ringing'
    when 'Silent'
      'Mode set to Silent'
    when 'Vibrate'
      'Mode set to Vibrate'
    else
      if activity[0] == 'passwordExpiry' 
         'Password Expiry Set' 
      elsif activity[0] == 'internalSettings'
        'Internal Settings Applied'
      elsif activity[0] == 'timeZone'
        'Time Zone Changed'
      elsif activity[0] == 'setCallDuration'
        'Callduration Set'
      elsif activity[0] == 'ringTone'
        'Ringtone Changed'
      elsif activity[0] == 'wallPaper'
        'Wallpaper Changed'
      elsif activity[0] == 'emailAccess'
        'Email Acces settings applied'
      elsif activity[0] == 'network'
        "Grps and Wifi Settings applied"
      else
        'Name Something'
      end
    end
  end

end
