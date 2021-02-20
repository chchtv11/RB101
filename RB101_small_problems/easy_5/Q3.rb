# given a time in string format
# split string by ":"
# set minutes_after = (first split, convert to int * 60) + second split, converted to int
# set minutes_before = 1440 - minutes_before

def after_midnight(time_string)
  split_string = time_string.split(":")
  hours = (split_string[0].to_i * 60) + split_string[1].to_i
  hours % 1440
end

def before_midnight(time_string)
  (1440 - after_midnight(time_string)) % 1440
end


after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
