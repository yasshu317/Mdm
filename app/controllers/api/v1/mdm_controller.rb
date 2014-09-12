class Api::V1::MdmController < ApplicationController
  skip_before_filter :authenticate_user!

  def checkin
    render  :text => "{\"successful\":true}" ,:status => 201
  end
  def server
    render  :text => "{\"successful\":true}" ,:status => 201
  end

end
