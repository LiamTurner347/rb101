DEGREE = "\xC2\xB0"

def dms(decimal)
  degrees = decimal.floor
  minutes_remainder = (decimal % 1) * 60
  minutes = minutes_remainder.floor
  seconds_remainder = (minutes_remainder % 1) * 60
  seconds = seconds_remainder.round

  output = printf("%i#{DEGREE}%02d'%02d\"", degrees, minutes, seconds)
  puts output
end

dms(30) # == %(30°00'00")
dms(76.73) # == %(76°43'48")
dms(254.6) # == %(254°36'00")
dms(93.034773) # == %(93°02'05")
dms(0) # == %(0°00'00")
dms(360) # == %(360°00'00") || dms(360) == %(0°00'00")