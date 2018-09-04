#! /usr/bin/env elixir

IO.gets "Hit enter to continue "
IO.puts ""

IO.puts """

Immutability of objects in Elixir
list = [104, 101, 108, 108, 111]
IO.puts list
list ++ [32, 33]
IO.puts list
list -- [108, 108]
IO.puts list
"""

list = [104, 101, 108, 108, 111]
IO.puts(list)
list ++ [32, 33]
IO.puts(list)
list -- [108, 108]
IO.puts(list)

IO.puts """

How to 'change' an object - get a new one
list = [104, 101, 108, 108, 111]
IO.puts list
list = list ++ [32, 33]
IO.puts list
list = list -- [108, 108]
IO.puts list
"""

list = [104, 101, 108, 108, 111]
IO.puts(list)
list = list ++ [32, 33]
IO.puts(list)
list = list -- [108, 108]
IO.puts(list)

IO.puts """

Head and tail of list
head = hd(list)
tail = tl(list)
IO.puts head
IO.puts tail
"""

head = hd(list)
tail = tl(list)
IO.puts(head)
IO.puts(tail)

IO.puts """

Lists are created using square brackets []
Lists are linked lists
Modification is fast
Tuples are created using squiggly brackets {}
Access is fast, but modification is slow

tuple = {:ok, "Hello"}
IO.inspect tuple
tuple = Tuple.append(tuple, :world)
IO.inspect tuple
"""

tuple = {:ok, "Hello"}
IO.inspect(tuple)
tuple = Tuple.append(tuple, :world)
IO.inspect(tuple)

IO.puts """

Tuples within lists can be written using colons

list_1 = [{:a, 1}, {:b, 2}]
list_2 = [a: 1, b: 2]
IO.puts 'Does list_1 equal list_2?'
IO.puts(list_1 == list_2)
"""

list_1 = [{:a, 1}, {:b, 2}]
list_2 = [a: 1, b: 2]
IO.puts('Does list_1 equal list_2?')
IO.puts(list_1 == list_2)

IO.puts """

IO.puts list_1[ :b ]
IO.puts list_2[ :b ]
"""

IO.puts(list_1[:b])
IO.puts(list_2[:b])

IO.puts """

Lists have atoms as keys
Keys can be given more than once: lists are not sets

kl = [ a: 1, a: 2, b: 3 ]
IO.puts( \"This is Keyword.get  \" )
IO.inspect Keyword.get( kl, :a)
IO.puts( \"This is Keyword.get_values  \" )
IO.inspect Keyword.get_values( kl, :a )
"""

kl = [a: 1, a: 2, b: 3]
IO.puts("This is Keyword.get  ")
IO.inspect(Keyword.get(kl, :a))
IO.puts("This is Keyword.get_values  ")
IO.inspect(Keyword.get_values(kl, :a))

IO.puts """

kl = [a: 1, a: 2, b: 3]
kl_new = Keyword.put_new(kl, :c, 5)
IO.inspect kl_new
IO.puts(Keyword.get(kl_new, :c))
"""

kl = [a: 1, a: 2, b: 3]
kl_new = Keyword.put_new(kl, :c, 5)
IO.inspect(kl_new)
IO.puts(Keyword.get(kl_new, :c))

IO.puts """

kl = [a: 1, a: 2, b: 3, b: 4, c: 0]
kl = Keyword.delete(kl, :a)
kl = Keyword.delete_first(kl, :b)

"""

kl = [a: 1, a: 2, b: 3, b: 4, c: 0]
kl = Keyword.delete(kl, :a)
kl = Keyword.delete_first(kl, :b)

IO.puts("IO.puts(Keyword.get(kl, :a))")
IO.puts(Keyword.get(kl, :a))

IO.puts("IO.puts(Keyword.get(kl, :b))")
IO.puts(Keyword.get(kl, :b))

IO.puts("IO.puts(Keyword.get(kl, :c))")
IO.puts(Keyword.get(kl, :c))

IO.puts """

Maps can use anything as a key
map = %{ :a => 1, 2 => :b }
IO.puts( map[ :a ] )
IO.puts( map[ 2 ] )
"""

map = %{:a => 1, 2 => :b}
IO.puts(map[:a])
IO.puts(map[2])

IO.puts """

Maps can't have duplicate keys

map = %{ :a => 1, :a => 2, :b => "Hello" }
IO.inspect map
"""

map = %{:a => 1, :a => 2, :b => "Hello"}
IO.inspect(map)

IO.puts """

Inserting and updating a map

map = %{ :a => 1, 2 => :b }
new_map = Map.put( map, :new_val, \"value\" )
IO.puts( new_map[ :new_val ] )
"""

map = %{:a => 1, 2 => :b}
new_map = Map.put(map, :new_val, "value")
IO.puts(new_map[:new_val])

IO.puts """

Maps have to use :a =>, not a:
map = %{ :a => 1, 2 => :b }
new_map = %{ map | a: 25 }
IO.puts( new_map[ :a ] )
"""

map = %{:a => 1, 2 => :b}
new_map = %{map | a: 25}
IO.puts(new_map[:a])

IO.puts """

Pattern matching
%{ :a => value_of_a } = %{ :a => 1, 2 => :b }
IO.puts( value_of_a )
"""

%{:a => value_of_a} = %{:a => 1, 2 => :b}
IO.puts(value_of_a)

IO.puts """

Pattern matching with variables
n = 1
map = %{ n => :one }
IO.inspect map
You can't do this:
map_with_hat = %{ ^n => :one }
map_with_hat = %{ 1 => :one, 2 => :two, 3 => :three }
You have to use %{ ^n => :one }
result = %{ ^n => :one } = %{ 1 => :one, 2 => :two, 3 => :three }
IO.inspect result
"""

n = 1
map = %{n => :one}
IO.inspect(map)
result = %{^n => :one} = %{1 => :one, 2 => :two, 3 => :three}
IO.inspect(result)

IO.puts """

map = %{ :a => 1, 2 => :b }
IO.puts( map.a )
"""

map = %{:a => 1, 2 => :b}
IO.puts(map.a)

IO.puts """

But you can't do this
IO.puts( map.2 )
You can only use the map.X style if your key is an atom
"""

IO.puts """

Now run file modules.ex
"""
