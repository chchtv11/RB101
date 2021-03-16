DEGREE = "\xC2\xB0"

def dms(number)
  degrees = number.floor
  minutes = ((number - degrees) * 60).floor
  seconds = ((((number - degrees) * 60) - minutes) * 60).floor
  "#{degrees}#{DEGREE}#{format("%02d", minutes)}'#{format("%02d", seconds)}\""

end



dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
