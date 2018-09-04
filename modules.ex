#! /usr/bin/env elixir

IO.gets "Hit enter to continue "
IO.puts ""

IO.puts """

defmodule Math do
   def sum(a, b) do
      a + b
   end
end
IO.puts( Math.sum( 1, 2 ))
"""

defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts(Math.sum(1, 2))

IO.puts """

defmodule Foo do
   def foobar do
     IO.puts "foobar"
   end
   defmodule Bar do
      def barfoo do
        IO.puts "barfoo"
      end
   end
end
Foo.foobar
Foo.Bar.barfoo
try do
  Foo.barfoo
rescue _ in UndefinedFunctionError ->
  IO.puts \"UndefinedFunctionError\"
end
%UndefinedFunctionError{}
"""

defmodule Foo do
  def foobar do
    IO.puts("foobar")
  end

  defmodule Bar do
    def barfoo do
      IO.puts("barfoo")
    end
  end
end

Foo.foobar()
Foo.Bar.barfoo()

try do
  Foo.barfoo()
rescue
  _ in UndefinedFunctionError ->
    IO.puts("UndefinedFunctionError")
end

%UndefinedFunctionError{}

IO.puts """

alias Foo.Bar, as: Bar
Bar.barfoo
"""

alias Foo.Bar, as: Bar
Bar.barfoo()

IO.puts """

alias String, as: Str
IO.puts(Str.length("Hello"))
"""

alias String, as: Str
IO.puts(Str.length("Hello"))

IO.puts """

require Integer
try do
  IO.puts Integer.is_odd 3
rescue _ in UndefinedFunctionError ->
  IO.puts "UndefinedFunctionError"
end
%UndefinedFunctionError{}
"""

require Integer
try do
  IO.puts(Integer.is_odd(3))
rescue
  _ in UndefinedFunctionError ->
    IO.puts("UndefinedFunctionError")
end

%UndefinedFunctionError{}

IO.puts """

require Integer
IO.puts Integer.is_odd 3
"""

require Integer
IO.puts(Integer.is_odd(3))

IO.puts """

import List, only: [duplicate: 2]

IO.inspect duplicate("hello", 3)
list_in_a_list = duplicate([1, 2], 2)
IO.inspect list_in_a_list
"""

import List, only: [duplicate: 2]

IO.inspect(duplicate("hello", 3))
list_in_a_list = duplicate([1, 2], 2)
IO.inspect(list_in_a_list)

IO.puts """


Anonymous functions
sum = fn ( a, b ) -> a + b end
result = sum.( 1, 5 )
IO.puts result
"""

sum = fn a, b -> a + b end
result = sum.(1, 5)
IO.puts(result)

IO.puts """

Also anonymous functions
sum = &( &1 + &2 )
result = sum.( 1, 2 )
IO.puts result
"""

sum = &(&1 + &2)
result = sum.(1, 2)
IO.puts(result)

IO.puts """

More anonymous functions
handle_result = fn
   \{var1\} -> IO.puts(\"\#\{var1\} found in a tuple\!\")
   \{var_2, var_3\} -> IO.puts(\"\#\{var_2\} and \#\{var_3\} found\!\")
end
handle_result.( \{ \"Hey people\" \} )
handle_result.( \{ \"Hello\", \"World\" \} )
"""

handle_result = fn
  {var1} -> IO.puts("#{var1} found in a tuple!")
  {var_2, var_3} -> IO.puts("#{var_2} and #{var_3} found!")
end

handle_result.({"Hey people"})
handle_result.({"Hello", "World"})

IO.puts """


Named function shorthand and redefining a module
defmodule Math do
   def sum(a, b) do
      666 * 42
   end
end

IO.puts \"Should say \nwarning: redefining module Math (current version defined in memory)\"
defmodule Math do
   def sum(a, b), do: a + b
end

IO.puts( Math.sum( 5, 6 ) )
"""

defmodule Math do
  def sum(a, b) do
    666 * 42
  end
end

IO.puts("Should say \nwarning: redefining module Math (current version defined in memory)")

defmodule Math do
  def sum(a, b), do: a + b
end

IO.puts(Math.sum(5, 6))

IO.puts """


Function shorthand

defmodule Math do
   def times(a, b), do: a * b
end
IO.puts Math.times( 5, 6 )
"""

defmodule Math do
  def times(a, b), do: a * b
end

IO.puts(Math.times(5, 6))

IO.puts """


The above code doesn't add to Math, like it would in Ruby

try do
  IO.puts( Math.sum( 5, 6 ) )
REE
  IO.puts \"UndefinedFunctionError\"
end
"""

try do
  IO.puts(Math.sum(5, 6))
rescue
  _ in UndefinedFunctionError ->
    IO.puts("UndefinedFunctionError")
end

IO.puts """


Private functions

defmodule Greeter do
   def hello(name), do: phrase() <> name
   defp phrase, do: "Hello "
end

IO.puts Greeter.hello("world")
try do
  IO.puts Greeter.phrase()
rescue _ in UndefinedFunctionError ->
  IO.puts "UndefinedFunctionError"
end
"""

defmodule Greeter do
  def hello(name), do: phrase() <> name
  defp phrase, do: "Hello "
end

IO.puts(Greeter.hello("world"))

try do
  IO.puts(Greeter.phrase())
rescue
  _ in UndefinedFunctionError ->
    IO.puts("UndefinedFunctionError")
end

IO.puts """


Default value for a function argument
defmodule Greater do
   def hello(name, country \\\\ \"en\") do
      phrase(country) <> name
   end

   defp phrase(\"en\"), do: \"Hello, \"
   defp phrase(\"es\"), do: \"Hola, \"
end

IO.puts Greater.hello(\"Ayush\", \"en\")
IO.puts Greater.hello(\"Ayush\")
IO.puts Greater.hello(\"Ayush\", \"es\")

"""

defmodule Greater do
  def hello(name, country \\ "en") do
    phrase(country) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

IO.puts(Greater.hello("Ayush", "en"))
IO.puts(Greater.hello("Ayush"))
IO.puts(Greater.hello("Ayush", "es"))

IO.puts """

Recursion

a = ["Hey", 100, 452, :true, "People"]
defmodule ListPrint do

You can't just say
   def print( [] ), do:
You have to do something
   def print( [] ), do: []

   def print( [head | tail] ) do
      IO.puts( head )
      print( tail )
   end

end
ListPrint.print(a)
"""

a = ["Hey", 100, 452, true, "People"]

defmodule ListPrint do
  def print([]), do: []

  def print([head | tail]) do
    IO.puts(head)
    print(tail)
  end
end

ListPrint.print(a)

IO.puts """

Loops using recursion

defmodule Loop do
   def print_multiple_times( msg, n ) when n <= 1 do
      IO.puts msg
   end

   def print_multiple_times( msg, n ) do
      IO.puts msg
      print_multiple_times( msg, n - 1 )
   end
end

Loop.print_multiple_times( "Hello", 5 )
"""

defmodule Loop do
  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts(msg)
  end

  def print_multiple_times(msg, n) do
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end
end

Loop.print_multiple_times("Hello", 5)

IO.puts """

Now run enum.ex

"""
