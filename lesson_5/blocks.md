### Exercise 3:
```
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```


| Line  | Action | Object | Side Effect | Return Value | Is Return Value Used? |
|---|---|---|---|---|---|
|1   |Method call `map`   | The outer array  | None   | New Array   | No
|1-4   | Block Execution | Local variable `arr` | None  | None  | No
| 2  | `first`  | `arr`  | None  | `arr[0]` | Yes, by `puts`
| 2  | `puts`  | `arr.first`  | Prints to console  | Nil   | No
| 3 | `first` | `arr` | None | `arr[0]` | Yes, by the block


### Example 4:
```
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
| Line  | Action | Object | Side Effect | Return Value | Is Return Value Used? |
|---|---|---|---|---|---|
|1   |Method call `each`   | The outer array  | None   | The outer array   | No
|1-7   | Block Execution | Inner Array - Local variable `arr` | None  | Outer array  | No
| 2  | Method call `each`  | Inner Array | None  | Inner Array | No
| 2-6  | Block Execution  | Inner Array Elements - Local variable `num` | None  | `nil` | No
| 3-5  | If Condition  | `num` | Executes `puts` if condition is met  | None | No
| 4  | `puts`  | `num`  | Converts to string & Prints to console  | `nil`   | No


### Example 5:
```
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

| Line  | Action | Object | Side Effect | Return Value | Is Return Value Used? |
|---|---|---|---|---|---|
| 1   | Method call `map`  | Outer array  | None  | New Array  | No |
| 1-5  | Outer Block Execution  | Each subarray  | None  | Each subarray  | Yes, by `map`  |
| 2  | Method call `map`  | Inner Array  | New Array  | No | Being passed to Outer Block  |
| 2-4  | Inner Block Execution  | Each subarray element  | None | `num * 2`  | Yes, by `map`  |
| 3  | Multiplication `*`  | Each subarray element  | None | Value of multiplication  | Yes, by the inner block  |


### Example 6:
```
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

- Using `select` to return a new array, containing only the hashes that match the criteria outlined in the outer Block. The individual hashes are passed to the outer block and a boolean value is returned.
- The individual key, value pairs of the hash are passed to the inner block
  - The logic `==` Evaluates if the first character of the value is equal to the string representation of the key symbol. Returns a boolean
- The method `all?` is used to determine if all return values of the inner block are true. This value is passed to the outer block


### Example 10:
```
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
```

- map1: takes outer array, returns new array
- block1: takes individual elements (inner arrays) from outer array. Returns
- map 2: takes individual inner arrays (ex. `[[1, 2], [3, 4]]`). Returns new array
- block2: takes individual elements from inner array  (ex. `[1, 2]` or `5`)
- if/else checks if the string representation of the element has 1 character.
    - If it does, it is assumed to be an integer and 1 is added to it
    - If not, map3 is executed
      - map3: Takes innermost array. Returns new array
      - block3: Takes elements from innermost array.
