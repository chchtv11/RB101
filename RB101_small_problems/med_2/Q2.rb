# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
BLOCKS = [
  ['B', 'O'],
  ['X', 'K'],
  ['D','Q'],
  ['C', 'P'],
  ['N', 'A'],
  ['G', 'T'],
  ['R', 'E'],
  ['F', 'S'],
  ['J', 'W'],
  ['H', 'U'],
  ['V', 'I'],
  ['L', 'Y'],
  ['Z', 'M']
]

def block_word?(word)
  BLOCKS.each do |block|
    block_count = 0
    word.each_char do |char|
      block_count += 1 if block.include?(char)
    end
    return false if block_count > 1
  end
  
  true
end

puts block_word?('BATCH') #== true
puts block_word?('BUTCH') #== false
puts block_word?('jest') #== true