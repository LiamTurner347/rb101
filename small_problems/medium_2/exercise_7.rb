=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. 
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) 
and that it will remain in use for the foreseeable future.
=end

#Algorithm:
# require the date module
# create a count variable and set it equal to 0
# iterate through each of the days for the twelve months from 01 Jan in the input year using a range and each
# for each day, if the date is 13 and the day is Friday, add 1 to the count
# return the count

require 'date'

def friday_13th(year)
  count = 0

  (Date.new(year, 01, 01)..(Date.new(year, 01, 01) >> 12)).each do |day|
    count += 1 if day.mday == 13 && day.friday?
  end

  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2