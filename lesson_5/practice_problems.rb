# Q1
arr = ['10', '11', '9', '7', '8']
arr.sort { |num1, num2| num2.to_i <=> num1.to_i }


# Q2
# sort by year, earliest to latest
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! { |item| item[:published].to_i }


# Q3
# reference 'g' in each
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]


# Q4
# Change 3 to 4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4


# Q5
# total age of males
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
munsters.map do |_, value|
  if value["gender"] == "male"
    value["age"]
  else 0
  end
end.sum


#Q6
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# (Name) is a (age)-year-old (male or female).
munsters.each do |key, value|
  puts "#{key} is a #{value['age']}-year-old #{value['gender']}"
end


# Q7
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a and b are unchanged because the element values of `arr` are being reassigned with `+=` and `-=`

# Q8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, arr|
  arr.each do |word|
    puts word.chars.select { |char| char.match?(/[a,e,i,o,u]/i) }
  end
end

# Q9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub|
  sub.sort { |a, b| b <=> a }
end


# Q10
array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_array = array.map do |hsh|
  incremented_hash = {}
  hsh.each { |key, value| incremented_hash[key] = value + 1 }
end

# Q11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr.map do |sub|
  sub.select { |item| item % 3 == 0 }
end

# Q12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
