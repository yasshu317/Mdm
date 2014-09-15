class Api::V1::MdmController < ApplicationController
  skip_before_filter :authenticate_user!

  def checkin
	debug_log request.body.read
	render  :text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>

     <!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\"

    \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">

     <plist version=\"1.0\">

     <dict>

     </dict>

     </plist>"
  end
  def server
	render  :text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>

     <!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\"

    \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">

     <plist version=\"1.0\">

     <dict>

     </dict>

     </plist>" 
  end

end
