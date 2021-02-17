# RB101 - Notes

- ``%`` is modulo operator
  - Differs from Integer#remainder: modulo returns absolute value. Remainder will return negative if given one
- Some boolean operators:
  - ``!!`` forces a boolean value eg `!!nil == false`
  - The ^ operator is a bit-wise operator for performing exclusive-or bit operation
    - e.g. `true ^ false == true` (only one value is true)
    - Only works with boolean or number values
  - a single bang `!` will invert the truthiness. But a double bang `!!` will return the same value `!!true == true`




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
