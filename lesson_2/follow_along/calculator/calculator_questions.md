1. Is there a better way to validate that the user has input a number?
We'll cover this in more detail in a future assignment.

- the main issue with using to_i() is that it will evaluate to 0 for strings without a number at the beginning
- so, if someone enters 0 or "0", the validation will fail.
- To avoid this, we could add a catch like so:

```
  def valid_number?(number)
    (number.to_i != 0) || [0, "0"].include?(number)
```

2. It looks like you can call to_i or to_f to convert strings to integers and floats, respectively. Look up the String#to_i and String#to_f documentation in Ruby docs and look at their various examples and use cases.



3. Our operation_to_message method is a little dangerous, because we're relying on the case statement being the last expression in the method. What if we needed to add some code after the case statement within the method? What changes would be needed to keep the method working with the rest of the program? We'll show a solution in an upcoming assignment.

- We'd need to return the case statement. Or assign its value to a parameter, then return that parameter (and possibly others if needed)

4. Most Rubyists don't invoke methods with parentheses, unless they're passing in an argument. For example, we use name.empty?(), but most Rubyists would write name.empty?. Some Rubyists even go as far as not putting parentheses around method calls even when passing in arguments. For example, they would write prompt "hi there" as opposed to prompt("hi there").

Try removing some of the optional parentheses when calling methods to get your eyes acquainted with reading different styles of Ruby code. This will be especially useful if you are using a DSL written in Ruby, like Rspec or Rails.

5. We're using Kernel.puts() and Kernel.gets(). But the Kernel. is extraneous as well as the parentheses. Therefore, we can just call those methods by gets and puts. We already know that in Ruby we can omit the parentheses, but how come we can also omit the Kernel.?

- We can omit the Kernel. because it is the core package and is implied
- from the docs: "The Kernel module is included by class Object, so its methods are available in every Ruby object."

6. There are lots of messages sprinkled throughout the program. Could we move them into some configuration file and access by key? This would allow us to manage the messages much easier, and we could even internationalize the messages. This is just a thought experiment, and no need to code this up.

- Yes, we could have a file called constants and assign all the messages there. Then load them into the program
