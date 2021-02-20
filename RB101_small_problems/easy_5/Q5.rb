def cleanup(string)
  string.gsub(/[^A-Za-z]/, " ").gsub(/ +/, " ")
end

cleanup("---what's my +*& line?") == ' what s my line '
