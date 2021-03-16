# RB101 - Notes

- ``%`` is modulo operator
  - Differs from Integer#remainder: modulo returns absolute value. Remainder will return negative if given one
- Some boolean operators:
  - ``!!`` forces a boolean value eg `!!nil == false`
  - The `^` operator is a bit-wise operator for performing exclusive-or bit operation
    - e.g. `true ^ false == true` (only one value is true)
    - Only works with boolean or number values
  - a single bang `!` will invert the truthiness. But a double bang `!!` will return the same value `!!true == true`
- Ternary Operator:
  - `(condition) ? do_if_true : do_if_false`



- re-do Precedence lesson
- Try to understand this: "Don't display something to the output and return a meaningful value. Since Ruby always returns a value, the key here is that the return value shouldn't be the intent of the method." (https://launchschool.com/lessons/a0f3cd44/assignments/aa99ad2d)

### Pass by value vs Pass by Reference
- Evaluation strategy: determines when expressions are evaluated, and what a method can do with the resulting objects
  - Ruby uses strict evaluation strategy - every expression is evaluated and converted to an object before it is passed along to a method
- Object passing strategies:
  - **Pass by value:**
    - A copy of an object is created, and it is that copy that gets passed around
    - It is impossible to change the original object
    - e.g. passing around immutable objects (numbers)
  - **Pass by reference:**
    - Establishes an alias between the argument and the original object
    - both the argument and object refer to the same location in memory
    - e.g. passing a mutable object and using a mutating method
- Ruby is "pass by reference value" or "pass by value of the reference"
  - Ruby makes copies of the references, then passes those copies to the method
  - The method can use the references to modify the referenced object, but since the reference itself is a copy, the original reference cannot be changed.

##Coding Tips 2
**Methods: Side Effect vs Return**
- A method can have a side effect (print a value, mutate an object)
- Or it can return a value
- It shouldn't do both

- Don't mutate a collection while iterating through it.
  - You can mutate the elements, but not the collection (e.g. don't delete elements)

### Lesson 3
- Numbers with the same value have the same object_id. Strings do not
- When you initialize a local variable within an if block, even if that if block doesn’t get executed, the local variable is initialized to nil.


### Lesson 4

#### PEDAC

**Examples**
- Might be expected to create your own examples

**Data Structure**
- Can indicate that the data structure will be an array
- Since arryas are practically universal, you don't need to wait until the coding step to define truthiness
- Its still high-level

**Algorithm**
- Avoid implementation detail
- Don't write in pseudocode first. Start with plain English
- Update the algorithm based on changes made during the implementation step, or to make notes from implementation
- Don't worry about efficiency

**Coding**
- If using helper method: Write first & test separately


#### More Methods

- `each_with_object`: takes a collection object, returns the collection object that was passed in. Object can be an array or hash
  - ex: `[1, 2, 3].each_with_object([]) { |num, array| array << num }`
  - Here it is taking an empty array as an argument, then referencing that array in the block as `array`
  - Adds an element to `array` for each element in `[1, 2, 3]`
- `include`: Only checks the keys of a hash, not the values
- `partition`: Divides the elements in the collection up into 2 arrays depending on a condition
  - Ex: `[true, false, true].partition { |val| val } #==> [[true , true], [false]]`


### Lesson 5

#### Nested Data Structures

- If you point to an object within another object, any changes made to that pointer will modify the original object as well. Example: The original object `a` is modified because its elements are reassigned when
```
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]

arr[0][1] = 8 # Side Effect: Reassigns the value of a[1] to 8
arr # => [[1, 8], [2]]
a   # => [1, 8]
```

- Shallow Copy: `dup` and `clone` allow copies of objects to be made, but the elements in the collections they copy are not copied.
- Example: This will modify both `arr1` and `arr2` because `upcase!` mutates the elements of the array, not the array itself. The elements in `arr1` and `arr2` are still pointing to the same objects.
```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!
```

- `freeze` can be used to prevent an object from being modified. But it only works on the object it is called on, not any nested objects.
