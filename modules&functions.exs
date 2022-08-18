

          # Modules & Functions in Elixir

#  1. Modules are declared using the keyword 'defmodule'
#  2. Modules are typically named using camel case i.e HelloWorld
#  3. do and end act as brackets where it is a block where code goes
#  4. Functions are name using snake case
#  5. You can also pass values to a function

defmodule ModulesFunctions do
  def say_hello do
    IO.puts('Hello world')
  end
  def say_whatever(staff) do
    IO.puts(staff)
  end
  def read_file(filename) do
    File.read(filename)
  end
end


#  Using the iex you can run the module using 'c()' if you are in the correct directory
# c("modules&functions.exs")
# [ModulesFunctions]
# ModulesFunctions.say_hello()
# Hello world
# :ok
