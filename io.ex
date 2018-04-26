#! /usr/bin/env elixir

IO.puts """

I/O

Creating a new file with File.open, &
pattern matching to store returned stream

{:ok, file} = File.open( \"newfile\", [:write] )
IO.binwrite( file, \"This will be written to the file\" )
"""
{:ok, file} = File.open( "newfile", [:write] )
IO.binwrite( file, "This will be written to the file" )

IO.puts """
Don't forget to close the file as soon as possible

File.close file
"""
File.close file

IO.puts """
tuple = File.read( \"newfile\" )
contents = elem( tuple, 1 )
IO.puts contents
"""
tuple = File.read( "newfile" )
contents = elem( tuple, 1 )
IO.puts contents

IO.puts """

Tuple loop with recursion

defmodule Loop do
  def get_new_block do
    Enum.random( [:z, :y, :x, :w, :v, :u, :t ] )
  end

  def get_n_blocks(blocks, n) do
    if n <= 0 do
      blocks
    else
      blocks = Tuple.append( blocks, get_new_block() )
      get_n_blocks(blocks, n - 1)
    end
  end
end

blocks = { :a, :b }
IO.inspect blocks
blocks = Loop.get_n_blocks( blocks, 3 )
IO.inspect blocks
blocks = Loop.get_n_blocks( blocks, 2 )
IO.inspect blocks
"""

defmodule Loop do
  def get_new_block do
    Enum.random( [:z, :y, :x, :w, :v, :u, :t ] )
  end

  def get_n_blocks(blocks, n) do
    if n <= 0 do
      blocks
    else
      blocks = Tuple.append( blocks, get_new_block() )
      get_n_blocks(blocks, n - 1)
    end
  end
end

blocks = { :a, :b }
IO.inspect blocks
blocks = Loop.get_n_blocks( blocks, 3 )
IO.inspect blocks
blocks = Loop.get_n_blocks( blocks, 2 )
IO.inspect blocks

IO.puts("""



Streams - like Enums but lazy


even? = &(rem(&1, 2) == 0)
res = 1..100 |>
      Stream.map( & ( &1 * 3 ) ) |>
      Stream.filter( even? ) |>
      Enum.sum
IO.puts(res)

""")
even? = &(rem(&1, 2) == 0)
res = 1..10 |>
      Stream.map( & ( &1 * 3 ) ) |>
      Stream.filter( even? ) |>
      Enum.sum
IO.puts(res)

IO.puts """

Stream.cycle([[name: "John", age: "42", id: "4774", plan: "premium"]])
|> Stream.take(1_000)
|> Stream.map(fn record ->
  [Enum.join(Keyword.values(record), ","), "\n"]
  end)
|> Stream.into(File.stream!("records.csv"))
|> Stream.run
stream = File.stream!( "records.csv" )
strs = Enum.take(stream, 10)
IO.puts strs
"""


Stream.cycle([[name: "John", age: "42", id: "4774", plan: "premium"]])
|> Stream.take(1_000)
|> Stream.map(fn record ->
  [Enum.join(Keyword.values(record), ","), "\n"]
  end)
|> Stream.into(File.stream!("records.csv"))
|> Stream.run
stream = File.stream!( "records.csv" )
strs = Enum.take(stream, 10)
IO.puts strs

IO.puts """

Now run processes.ex

"""
