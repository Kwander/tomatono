# Notifications gem
# Gonna be cross platform soon, suckers


# Ubuntu notifications library
require_relative 'lib/notify-osd-ruby.rb'


class Notif
  
  def initialize(title, body)
    @title = title
    @body = body
  end
  
  def post
      notification = Notification.new()
      notification.title = @title
      notification.body = @body
      notification.post
  end
  
  
end