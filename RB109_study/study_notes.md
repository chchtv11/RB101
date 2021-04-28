# TODO:
- re-do precendence lesson
- Try to understand this: "Don't display something to the output and return a meaningful value. Since Ruby always returns a value, the key here is that the return value shouldn't be the intent of the method." (https://launchschool.com/lessons/a0f3cd44/assignments/aa99ad2d)
- re-do lesson where we had to break down each line in a chart and explain what was happening


# Prep Videos

## Part 1


### Syntactical Sugar

- Method invocation: parentheses are optional
  - When there are no parentheses, it's hard to know if something is a variable or a method
  - Language to use: "Printing out the return value of the method invocation"
  - Even if there are >1 variables, parentheses are not required. 
    - i.e. `'hello'.concat ' world', '!'`

### Where Does the Code Come From?

1. Core API/Library

  - Loaded at runtime
  - Organized into classes/modules (i.e. `String`)
  - One of them is Kernel, which contains core methods (i.e. `puts`)
    - `Kernel.puts("hello")` is equivalent to `puts hello`
    
2. Standard Library

  - Comes with Ruby but is not automatically loaded, otherwise it would bloat Ruby
  - You have to `require` a library if you want to use it

3. Extended Library/Gem

  - Externally developed. Can install & use
  - i.e. `pry`



### Local Variable Scope

  - If you initiatize a variable before a block:
    - It is accessible in the local scope and can be modified/reassigned within the block
  - If it is not initiatized, it will only be accessible within the scope of the block
  - Global variables start with a `$` and are acccessible anywhere in the program, regardless of scope

  
### Pass by value vs. Pass by Reference

**Example 1**
```
1   def amethod(param)      # on Line 7, param is assigned to str
2     param += 'world'      # reassignment of param to new object
3     param << 'universe'   # references the new object assigned to the var                                     #`param` in the method scope
4   end
5
6   str = 'hello'
7   amethod(str)            # prints "hello" -- `str` is unchanged
```
- The descructive operation on line 3 is being performed on the new string object assigned on line 2. 
- It has nothing to do with `str` in the local scope


**Example 2**

```
a = 'hello'
b = a
```
- Here, there are 2 variables, but only 1 object
- variables `a` and `b` are both initiatized, they point to the same object


### Collections
Collections consist of arrays & hashes

**Hashes:**
  - `fetch` will throw a key error if the key doesn't exist
  - vs. `hsh['a']` will return `nil` 
    - It's ambiguous: don't know if the value of `a` in the hash is `nil` or if it isn't a key in `hsh` at all


**Definition of `select`:**

Select returns a new array based on the block's return value. 
If the return value evaluates to `true`, then the element is selected

**Enumerable**
- All you need to use methods from the `Enumerable` module is the ability to use the method `each`

 
# Study Tips

- Terms/Things to include in code explanations:
    - What *scope* is the variable?
    - *initialized*: "local variable `a` is initialized to a string object with the value `'hello'`"
    - *assigned*: "local variable `a` is assigned to a string object with the value `'hello'`"
    - *reassigned*: "local variable `a` is reassigned to a different string object with the value `'goodbye'`"
    - Method parameters vs arguments
        - *defined* with *parameters*: "We are defining the method `example` which takes 1 parameter"
        - *called/invoked* with *arguments*: "we are calling the method `example` and passing in the string `'hello'` as an argument to it"
    - Blocks: 
        - "We are calling the method `loop` and passing in the `do..end` block as an argument."
        - `arr.each { |i| puts i }`: "We are calling the method `each` on the array `arr` and passing in the `{}` block as an argument with one parameter `i`"
    - Reassignment w/ method:`i -= 1`:
        - "reassigning the local variable `i` to the return value of a method call Integer#- on local variable i with integer 1 passed to it as an argument." 
    - *break*: "we are breaking out of the loop by using the keyword `break` `if` the value of the object that local variable i is referencing is equal to 0."
    - *output* -- anything that is printed
    - *returns* -- what the method returns
    - "The method `puts` is called and the local variable `a` is passed to it as an argument"
    - *evaluates to true* or *is truthy*

**Example**

```
a = 'hello'
b = a
a = 'goodbye'
```

- Line 1: 
    - local variable `a` is *initialized*
    - string object with the value `'hello'` is *assigned* to the local variable `a`
- Line 2: 
    - local variable `b` is *initialized*
    - The same object that is *assiged* to `a` is now assigned to `b`
- Line 3:
    - local variable `a` is *reassigned* to a different string object with the value `'goodbye'`

**Object IDs**:
- The ID of an object assigned to a variable will be the same before & after a mutating method is called on the variable.
- Integers of the same value will have the same object ID
- Symbols with the same value will have the same object ID
- Reassignment will result in a new object ID

# References and Mutability in Ruby
[*Source*](https://launchschool.com/blog/references-and-mutability-in-ruby)

## Understand Variable References
###Immutable Objects
- Any class can be immutable, by simply not providing any methods that alter its state.
- nil (the only member of the NilClass class) and Range objects (e.g., 1..10) are immutable

###Mutable Objects
- Indexed assignment is mutating. e.g. `a[0]` will mutate `a`
- Collections, such as arrays, have an object ID. Each element in their collection has its own object ID too.
    -  Its possible to modify a collection's elements while keeping the array object ID the same
-  Strings operate similarly. They don't have a separate object for each character, but the mutability is the same (can change characters without changing the string's object ID)
-  Concatenation is mutating. `<<` mutates the caller but `+=` doesn't