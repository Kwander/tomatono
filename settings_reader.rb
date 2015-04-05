require 'json'

class Settings_Reader
  
  attr_accessor :work_time, :break_time, :work_text,
  :return_text, :break_text, :work_notif_header,
  :break_notif_header, :status_notif_header,
  :work_status, :break_status
  
  
  def initialize
    target = open("settings.txt", 'r')
    text = target.read()
    settings = JSON.parse(text)
    
    @work_time = settings["work_time"]
    @break_time = settings["break_time"]
    @work_text = settings["work_text"]
    @return_text = settings["return_text"]
    @break_text = settings["break_text"]
    @work_notif_header = settings["work_notif_header"]
    @break_notif_header = settings["break_notif_header"]
    @status_notif_header = settings["status_notif_header"]
    @work_status = settings["work_status"]
    @break_status = settings["break_status"]
  end
  
end


settings = Settings_Reader.new()