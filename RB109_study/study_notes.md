# TODO:

- Are parenthesis require for a method when there are > 1 arguments? (i.e. `concat('hello', 'you')`)

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
1   def amethod(param)      # param is assigned to str
2     param += 'world'      # reassignment of param to new object
3     param << 'universe'   # references the new object `param` in the method scope
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
If it evaluates to `true`, then the element is selected

**Enumerable**
- All you need to use methods from the `Enumerable` module is the ability to use the method `each`

 
