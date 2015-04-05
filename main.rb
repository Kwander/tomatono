require_relative 'notifications'
require_relative 'settings_reader'

class Timer
  
  def initialize
    # Current time in seconds
    @time = 0
     
    settings = Settings_Reader.new
    @work_time = Integer(settings.work_time) * 60
    @break_time = Integer(settings.break_time) * 60
    @work_text = settings.work_text
    @return_text = settings.return_text
    @break_text = settings.break_text
    @work_notif_header = settings.work_notif_header
    @break_notif_header = settings.break_notif_header
    @status_notif_header = settings.status_notif_header
    @work_status = settings.work_status
    @break_status = settings.break_status
  end
  
  def launch
    
    while true
      work_time()
      break_time()
    end
    
  end
  
  def work_time()
    puts @work_text
    
    notification = Notif.new(@work_notif_header, @work_text)
    notification.post
    
    @time = 0
    sleep(1)
    
      while @time < @work_time
	@time += 1
	puts "#{min_remaining()} minutes remaining" if (@time % 60) == 0
	
	if (@time % 60) == 0
	  notification = Notif.new(@work_notif_header, "#{@work_status} #{@time / 60} minutes.")
	  notification.post
	end
	
	sleep(1)
      end
      
  end
  
  def break_time
    puts @break_text
    @time = 0
    sleep(1)
    
    while @time < @break_time
	@time += 1
	puts "#{min_remaining()} minutes remaining" if (@time % 60) == 0
	notification = Notif.new(@break_notif_header, "#{@break_status} #{@time / 60} minutes.")
	notification.post
	sleep(1)
    end
    
  end
  
  def reset
  end
  
  def stop_time
  end
  
  def min_remaining()
    (1500 - @time) / 60
  end
  
  
end

timer = Timer.new
timer.launch