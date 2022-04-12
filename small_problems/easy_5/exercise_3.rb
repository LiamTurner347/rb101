def after_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  result = (hours * 60) + minutes
  result == 1440 ? 0 : result
end

def before_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  result = ((hours - 1) * 60) + (60 - minutes)
  result == 1440 ? 0 : result
end

p after_midnight('00:00') # == 0
p before_midnight('00:00') # == 0
p after_midnight('12:34') # == 754
p before_midnight('12:34') # == 686
p after_midnight('24:00') # == 0
p before_midnight('24:00') # == 0
