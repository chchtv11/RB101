def swap_name(name)
  names_split = name.split
  "#{names_split[1]}, #{names_split[0]}"
end

swap_name('Joe Roberts') == 'Roberts, Joe'
