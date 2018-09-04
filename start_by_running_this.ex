#! /usr/bin/env elixir

IO.puts """
How to use:
Get Elixir (version 1.7.2 or above)
Open each file in your favourite editor
Run each file from the command line by typing its name
"""

IO.gets "Hit enter to continue "
IO.puts ""

IO.puts """
try do
  a = 24
  b = 25
  ^a = b
rescue
  _ in MatchError ->
  IO.puts "MatchError"
end
"""

try do
  a = 24
  b = 25
  ^a = b
rescue
  _ in MatchError ->
    IO.puts("MatchError")
end

IO.puts ""

IO.puts """
n = 10
x = {:ok, n}
case x do
  {:ok, 11} -> IO.puts 11
  {:ok, y} -> IO.puts y
end
"""

n = 10
x = {:ok, n}

case x do
  {:ok, 11} -> IO.puts(11)
  {:ok, y} -> IO.puts(y)
end

IO.puts ""

IO.puts """
case x do
  {z, n} -> IO.puts \"n is \#\{ n \}\"
  {:ok, y} -> IO.puts y
end
"""

case x do
  {z, n} -> IO.puts("n is #{n}")
  {:ok, y} -> IO.puts(y)
end

IO.puts ""

IO.puts """
var_1 = "Hello world"
var_2 = "Hello Elixir"
if var_1 === var_2 do
   IO.puts(\"\#\{var_1\} and \#\{var_2\} are the same\")
else
   IO.puts(\"\#\{var_1\} and \#\{var_2\} are not the same\")
end
"""

var_1 = "Hello world"
var_2 = "Hello Elixir"

if var_1 === var_2 do
  IO.puts("\"#{var_1}\" and \"#{var_2}\" are the same")
else
  IO.puts("\"#{var_1}\" and \"#{var_2}\" are not the same")
end

IO.puts ""

IO.puts("IO.puts(String.reverse(\"Elixir\"))")
IO.puts(String.reverse("Elixir"))
IO.puts ""

IO.puts """
IO.puts(String.match?(\"foo\", ~r/foo/))
IO.puts(String.match?(\"bar\", ~r/foo/))
"""

IO.puts(String.match?("foo", ~r/foo/))
IO.puts(String.match?("bar", ~r/foo/))
IO.puts ""

IO.puts("IO.puts(\"foo\" =~ ~r/foo/)")
IO.puts("foo" =~ ~r/foo/)
IO.puts ""

IO.puts """
a = String.at( \"foobar\", 3 )
b = String.at( \"foobar\", 6 )
IO.puts "a is \#\{a\}\"
IO.puts "b is \#\{b\}\"
if b === nil do
  IO.puts \"b is nil\"
end
"""

a = String.at("foobar", 3)
b = String.at("foobar", 6)
IO.puts("a is #{a}")
IO.puts("b is #{b}")

if b === nil do
  IO.puts("b is nil")
end

IO.puts ""

IO.puts("Difference between 'single quotes' and \"double quotes\"")

IO.puts """
char_list = to_charlist(\"hełło\")
IO.puts char_list
IO.puts \"Is char_list a list?\"
IO.puts is_list( char_list )
string = to_string ('hełło')
IO.puts string
IO.puts \"Is string binary?\"
IO.puts is_binary( string )
"""

char_list = to_charlist("hełło")
IO.puts(char_list)
IO.puts("Is char_list a list?")
IO.puts(is_list(char_list))
string = to_string('hełło')
IO.puts(string)
IO.puts("Is string binary?")
IO.puts(is_binary(string))

IO.puts "\nNow run immutability.ex"
IO.puts ""
