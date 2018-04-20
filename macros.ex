#! /usr/bin/env elixir

IO.puts """

Macros

num = 25
IO.inspect quote do: sum(15, num)
IO.inspect quote do: sum(15, unquote(num))
"""
num = 25
IO.inspect quote do: sum(15, num)
IO.inspect quote do: sum(15, unquote(num))

IO.puts """


What are macros useful for?

This is not a particularly useful example!

defmodule OurMacro do
   defmacro unless(expr, do: block) do
      quote do
         if ! unquote(expr), do: unquote(block)
      end
   end
end

defmodule OurModule do
  require OurMacro

  def main do
    the_truth = 6 * 7 == 42
    OurMacro.unless the_truth, do: IO.puts \"The truth is false\"
    OurMacro.unless ! the_truth, do: IO.puts \"The truth is not false\"
  end
end

OurModule.main
"""
defmodule OurMacro do
   defmacro unless(expr, do: block) do
      quote do
         if ! unquote(expr), do: unquote(block)
      end
   end
end

defmodule OurModule do
  require OurMacro

  def main do
    the_truth = 6 * 7 == 42
    OurMacro.unless the_truth, do: IO.puts "The truth is false"
    OurMacro.unless ! the_truth, do: IO.puts "The truth is not false"
  end
end

OurModule.main

IO.puts """


From the horse's mouth: https://www.tutorialspoint.com/elixir/elixir_macros.htm:
\"Macros can be used in much more complex tasks but should be used sparingly.
This is because metaprogramming in general is considered a bad practice and
should be used only when necessary.\"

These examples miss Crypto, Binary and Queue. These can be found at
https://www.tutorialspoint.com/elixir/elixir_libraries.htm.


System commands

defmodule StringFunctions do
  def print_out_ls() do
    pair = System.cmd "ls", []
    strs = elem( pair, 0 )
    list = String.split( strs, \"\\n\" )
    Enum.each( list, fn( s ) -> IO.puts( s ) end )
  end
end

IO.puts "Current folder"
IO.puts System.cwd()
IO.puts ""
cmd = System.cmd "echo", ["Hello", "World"]
IO.puts( elem( cmd, 0) )
IO.puts "Creating NEWFILE\\n"
System.cmd "touch", ["NEWFILE"]
StringFunctions.print_out_ls()
IO.puts "Deleting NEWFILE\\n"
System.cmd "rm", ["NEWFILE"]
StringFunctions.print_out_ls()

"""

defmodule StringFunctions do
  def print_out_ls() do
    pair = System.cmd "ls", []
    strs = elem( pair, 0 )
    list = String.split( strs, "\n" )
    Enum.each( list, fn( s ) -> IO.puts( s ) end )
  end
end

IO.puts "Current folder"
IO.puts System.cwd()
IO.puts ""
cmd = System.cmd "echo", ["Hello", "World"]
IO.puts( elem( cmd, 0) )
IO.puts "Creating NEWFILE\n"
System.cmd "touch", ["NEWFILE"]
StringFunctions.print_out_ls()
IO.puts "Deleting NEWFILE\n"
System.cmd "rm", ["NEWFILE"]
StringFunctions.print_out_ls()
