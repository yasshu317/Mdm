class DashboardController < ApplicationController
  #before_action :authenticate_user!

  def index
  end

  def pushnotify
    settings = params[:value]
    destination = ["APA91bEZ6mYNgGChEgWJd5g2o0QHqPgT9PDMcwie01nb9jrGPTvktepuzt01DIH6W8LjpL9leoYGxtlKr8dizCYFSq6IWosJdvQ3_cd8SYCvqmJc3kTXk-Xa-f6_O1eWBzWvE8J1DuplcM3GnpHP7b2QWW8F6r4QNA"]
    # must be an hash with all values you want inside you notification
    data = {:mdm => "#{settings}"}
    # Notification with custom information
    res = GCM.send_notification(destination, data)
  end
end
