#PART 1

def time_of_day(integer)
  days_rem = integer % 1440
  hours, minutes = days_rem.divmod(60)
  format('%02d:%02d', hours, minutes)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


#PART 2

require 'date'
def time_of_day(delta_minutes)
  (Date.parse("Sunday") + Rational(delta_minutes, 1440)).strftime("%A %H:%M")
end

p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"
