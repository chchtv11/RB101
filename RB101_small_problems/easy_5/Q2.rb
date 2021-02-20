DAY_MINUTES = 1440
def time_of_day(int)
  reduce_int = int.between?(1-DAY_MINUTES, 0) ? int : (int % DAY_MINUTES)
  time_int = (reduce_int < 0) ? (DAY_MINUTES + reduce_int) : reduce_int
  hour = time_int / 60
  minute = time_int % 60
  "#{hour.to_s.rjust(2, "0")}:#{minute.to_s.rjust(2, "0")}"
end

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
