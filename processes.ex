#! /usr/bin/env elixir

IO.gets "Hit enter to continue "
IO.puts ""

IO.puts """

Processes

pid = spawn(fn -> 2 * 2 end)
IO.puts Process.alive?( pid )
"""
pid = spawn(fn -> 2 * 2 end)
IO.puts Process.alive?( pid )

IO.puts """

pid = self()
Process.alive?(pid)
"""

pid = self()
IO.puts Process.alive?(pid)

IO.puts """

send(self(), {:hello, \"Hi people\"})
send(self(), { :goodbye, \"Goodbye people\" })

The second message above should call the second response below, but doesn't
receive do
   {:hello, msg} -> IO.puts(msg)
   {_, msg} -> IO.puts(\"This one won't match!\")
end
"""

send(self(), { :hello, "Hi people" })
send(self(), { :goodbye, "Goodbye people" })

receive do
   {:hello, msg} -> IO.puts(msg)
   {_, msg} -> IO.puts( "This one won't match!" )
end

IO.puts """

Regular expressions

regex = ~r/foo|bar/
IO.puts( \"foo\" =~ regex )
IO.puts( \"baz\" =~ regex )
"""
regex = ~r/foo|bar/
IO.puts( "foo" =~ regex )
IO.puts( "baz" =~ regex )

IO.puts """


Sigils

new_string = ~s(this is a string with \"double\" quotes, not 'single' ones)
IO.puts(new_string)
new_word_list = ~w(foo bar bat)
IO.inspect(new_word_list)
"""
new_string = ~s(this is a string with "double" quotes, not 'single' ones)
IO.puts(new_string)
new_word_list = ~w(foo bar bat)
IO.inspect(new_word_list)

IO.puts """

More about errors

defmodule Foo do
   def foobar do
     IO.puts \"foobar\"
   end
end

err = try do
  Foo.barfoo
rescue
  _ in UndefinedFunctionError ->
    IO.puts "UndefinedFunctionError
end
IO.inspect err
"""

defmodule Foo do
   def foobar do
     IO.puts "foobar"
   end
end

err = try do
  Foo.barfoo
rescue
  _ in UndefinedFunctionError ->
    IO.puts "UndefinedFunctionError"
end
IO.inspect err

IO.puts """

Multiple error handling matchers

err = try do
   1 + "Hello"
rescue
   RuntimeError -> "You've got a runtime error!"
   ArithmeticError -> "You've got an Argument error!"
end

IO.inspect err
"""
err = try do
   1 + "Hello"
rescue
   RuntimeError -> "You've got a runtime error!"
   ArithmeticError -> "You've got an Arithmetic error!"
end

IO.inspect err


IO.puts """

Throwing exceptions

val = try do
   Enum.each 20..100, fn(x) ->
      if rem(x, 13) == 0, do: throw x
   end
   \"Got nothing\"
catch
   x -> \"Got \#{x}\"
end

IO.inspect val
"""
val = try do
   Enum.each 20..100, fn(x) ->
      if rem(x, 13) == 0, do: throw x
   end
   "Got nothing"
catch
   x -> "Got #{x}"
end

IO.inspect val

IO.puts """

The use of 'after' to guarantee something which should happen,
happens after an error is caught

{:ok, file} = File.open "newfile", [:utf8, :write]
try do
  IO.write file, "Holá"
  raise "Error"
rescue
  _ in RuntimeError ->
    IO.puts "RuntimeError"
after
  IO.puts "Closing file"
  File.close(file)
end
"""
{:ok, file} = File.open "newfile", [:utf8, :write]
try do
  IO.write file, "Holá"
  raise "Error"
rescue
  _ in RuntimeError ->
    IO.puts "RuntimeError"
after
  IO.puts "Closing file"
  File.close(file)
end

IO.puts """

Now try macros.ex

"""
