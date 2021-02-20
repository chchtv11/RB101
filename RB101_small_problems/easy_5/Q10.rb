def print_in_box(string)

  inner_space = string.length + 2
  h_border = "+#{'-' * inner_space}+"
  buffer =  "|#{' ' * inner_space}|"
  string_format = "| #{string} |"
  puts [h_border, buffer, string_format, buffer, h_border].join("\n")
end


print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')

# running_total = []
# breakpoints = []
# lengths = string.split.map {|num| num.length }
# lengths.each_index { |idx| running_total << lengths.first(idx + 1).sum }
# (running_total.max / 80.0).ceil.times do |n|
#   breakpoints << running_total.rindex { |total| total <= (20 * n) }
