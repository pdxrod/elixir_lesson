#! /usr/bin/env elixir

IO.puts("""
Using the Enum module

the_list = [1, 2, 3, 4]

res = Enum.all?( the_list, fn( s ) -> rem( s, 2 ) == 1 end )
IO.puts( \"Result of Enum.all? \#{ res } \" )

res = Enum.any?( the_list, fn( s ) -> rem( s, 2 ) == 1 end )
IO.puts( \"Result of Enum.any? \#{ res } \" )
""")

the_list = [1, 2, 3, 4]

res = Enum.all?(the_list, fn s -> rem(s, 2) == 1 end)
IO.puts("Result of Enum.all? #{res} ")

res = Enum.any?(the_list, fn s -> rem(s, 2) == 1 end)
IO.puts("Result of Enum.any? #{res} ")

IO.puts("""

Using Enum.each to do a loop

the_list = [ "Hello", "Every", "one" ]
Enum.each( the_list, fn( s ) -> IO.puts( s ) end )
""")

the_list = ["Hello", "Every", "one"]
Enum.each(the_list, fn s -> IO.puts(s) end)

IO.puts("""

Enum.map, and IO.puts not working for lists - use IO.inspect

res = Enum.map( [2, 5, 3, 6], fn(a) -> a * 2 end )
IO.puts \"IO.puts( res )\"
IO.puts( res )
IO.puts \"IO.inspect( res )\"
IO.inspect( res )
""")

res = Enum.map([2, 5, 3, 6], fn a -> a * 2 end)
IO.puts("IO.puts( res )")
IO.puts(res)
IO.puts("IO.inspect( res )")
IO.inspect(res)

IO.puts("""

Enum.reduce

First, no accumulator, just add up the numbers in the list
res = Enum.reduce( [1, 2, 3, 4], fn(x, accum) -> x + accum end )
IO.puts res

Now, give an accumulator of 5, which is added to the sum of the list
res = Enum.reduce( [1, 2, 3, 4], 5, fn( x, accum ) -> x + accum end )
IO.puts res

Notice that the results are not shown when the code says - both results are shown after both reduces
""")

res = Enum.reduce([1, 2, 3, 4], fn x, accum -> x + accum end)
IO.puts(res)

res = Enum.reduce([1, 2, 3, 4], 5, fn x, accum -> x + accum end)
IO.puts(res)

IO.puts("""


A more complex example, showing anonymous functions and pipelining with 3 Enum functions

odd? = &( rem( &1, 2 ) != 0 )
res = 1..100 |>
      Enum.map( & ( &1 * 3 ) ) |>
      Enum.filter( odd? ) |>
      Enum.sum
IO.puts(res)
""")

odd? = &(rem(&1, 2) != 0)

res =
  1..100
  |> Enum.map(&(&1 * 3))
  |> Enum.filter(odd?)
  |> Enum.sum()

IO.puts(res)

IO.puts """


Comprehensions

IO.inspect Enum.map(1..3, &(&1 * 2))
IO.inspect for n <- 1..3, do: n * 2
"""
IO.inspect Enum.map(1..3, &(&1 * 2))
IO.inspect for n <- 1..3, do: n * 2

IO.puts """

import Integer
IO.inspect(for x <- 1..10, is_even(x), do: x)
"""
import Integer
IO.inspect(for x <- 1..10, is_even(x), do: x)

IO.puts """

IO.puts(for <<c <- \" hello world \">>, c != ?\\s, into: \"\", do: <<c>>)
"""
IO.puts(for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>)

IO.puts """


Types

defmodule Util do
  types = ~w[function nil integer binary bitstring list map float atom tuple pid port reference]
  for type <- types do
    def typeof(x) when unquote(:"is_\#{type}")(x), do: unquote(type)
  end
end

list = [:a, :b]
IO.write "[:a, :b] is a "
IO.puts Util.typeof list
IO.write "'' is a "
IO.puts Util.typeof ''
IO.write "\"\" is a "
IO.puts Util.typeof ""
IO.write "5.6 is a "
IO.puts Util.typeof 5.6
"""

defmodule Util do
  types = ~w[function nil integer binary bitstring list map float atom tuple pid port reference]
  for type <- types do
    def typeof(x) when unquote(:"is_#{type}")(x), do: unquote(type)
  end
end

list = [:a, :b]
IO.write "[:a, :b] is a "
IO.puts Util.typeof list
IO.write "'' is a "
IO.puts Util.typeof ''
IO.write "\"\" is a "
IO.puts Util.typeof ""
IO.write "5.6 is a "
IO.puts Util.typeof 5.6

IO.puts("""

Now run structs.ex
""")
