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

IO.puts """

Now run processes.ex

"""
