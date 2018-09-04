#! /usr/bin/env elixir

IO.gets "Hit enter to continue "
IO.puts ""

IO.puts """

Structs

This doesn't work (from https://www.tutorialspoint.com/elixir/elixir_structs.htm):

defmodule User do
   defstruct name: "John", age: 27
end
new_john = %User{}
ayush = %User{name: \"Ayush\", age: 20}
megan = %User{name: \"Megan\"}
IO.inspect new_john
IO.inspect ayush
IO.inspect megan

This does:
defmodule User do
   defstruct name: "John", age: 27
end
defmodule Main do
  def main do
    new_john = %User{}
    ayush = %User{name: "Ayush", age: 20}
    megan = %User{name: "Megan"}
    IO.inspect new_john
    IO.inspect ayush
    IO.inspect megan
  end
end
Main.main

(from https://stackoverflow.com/questions/39576209/elixir-cannot-access-struct#39576345)

"""

defmodule User do
  defstruct name: "John", age: 27
end

defmodule Main do
  def main do
    new_john = %User{}
    ayush = %User{name: "Ayush", age: 20}
    megan = %User{name: "Megan"}
    IO.inspect(new_john)
    IO.inspect(ayush)
    IO.inspect(megan)
  end
end

Main.main()

IO.puts """

More

defmodule NotMain do
  def main do
    john = %User{ }
    meg = %{ john | name: "Meg" }
    IO.puts "Meg: "
    IO.puts \"Name \#{ meg.name }, age \#{ meg.age }\"
  end
end
NotMain.main
"""

defmodule NotMain do
  def main do
    john = %User{}
    meg = %{john | name: "Meg"}
    IO.puts("Meg: ")
    IO.puts("Name #{meg.name}, age #{meg.age}")
  end
end

NotMain.main()

IO.puts """

Protocols

defprotocol Blank do
   def blank?(data)
end

# Implementing the protocol for lists
defimpl Blank, for: List do
   def blank?( [] ), do: true
   def blank?( _ ), do: false
end

# Implementing the protocol for strings
defimpl Blank, for: BitString do
   def blank?( \"\" ), do: true
   def blank?( _ ), do: false
end

# Implementing the protocol for maps
defimpl Blank, for: Map do
   def blank?( map ), do: map_size( map ) == 0
end

IO.puts( Blank.blank? [] )
IO.puts( Blank.blank? [:true, \"Hello\"] )
IO.puts( Blank.blank? \"\" )
IO.puts( Blank.blank? \"Hi\" )
IO.puts( Blank.blank? %{ } )
IO.puts( Blank.blank? %{ a: 1 } )
IO.puts( Blank.blank? { a: 1 } )

# Unimplemented
try do
  IO.puts( Blank.blank?( IO ))
rescue e in Protocol.UndefinedError -> e
  IO.puts \"Blank.blank?( IO ) raised a 'Protocol.UndefinedError'\"
end
"""

defprotocol Blank do
  def blank?(data)
end

defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

defimpl Blank, for: BitString do
  def blank?(""), do: true
  def blank?(_), do: false
end

defimpl Blank, for: Map do
  def blank?(map), do: map_size(map) == 0
end

IO.puts(Blank.blank?([]))
IO.puts(Blank.blank?([true, "Hello"]))
IO.puts(Blank.blank?(""))
IO.puts(Blank.blank?("Hi"))
IO.puts(Blank.blank?(%{}))
IO.puts(Blank.blank?(%{a: 1}))
IO.puts(Blank.blank?(a: 1))

try do
  IO.puts(Blank.blank?(IO))
rescue
  e in Protocol.UndefinedError ->
    e
    IO.puts("Blank.blank?( IO ) raised a 'Protocol.UndefinedError'")
end

IO.puts """

Thanks to Kevin Rockwood for this example
https://www.youtube.com/watch?v=sJvfCE6PFxY

defprotocol Blank do
  @fallback_to_any true
  def blank?(data)
end

defimpl Blank, for: Any do
  def blank?( _ ), do: false
end

try do
  IO.puts(Blank.blank?(IO))
  IO.puts(\"Blank.blank?( IO ) did not raise a 'Protocol.UndefinedError'\")
rescue
  e in Protocol.UndefinedError ->
    e
    IO.puts("Blank.blank?( IO ) raised a 'Protocol.UndefinedError'")
end
"""

defprotocol Blank do
  @fallback_to_any true
  def blank?(data)
end

defimpl Blank, for: Any do
  def blank?( _ ), do: false
end

try do
  IO.puts(Blank.blank?(IO))
  IO.puts("Blank.blank?( IO ) did not raise a 'Protocol.UndefinedError'")
rescue
  e in Protocol.UndefinedError ->
    e
    IO.puts("Blank.blank?( IO ) raised a 'Protocol.UndefinedError'")
end

IO.puts """


Behaviours - what happens if you derive a module from a Behaviour, and do not
implement all its functions - you get a warning, then an error when you call it

defmodule ABehaviour do
  @callback function_one() :: BitString
  @callback function_two() :: BitString
end

defmodule ABehaviourFullyImplemented do
  @behaviour ABehaviour

  def function_one(), do: "ABehaviourFullyImplemented fully implemented function one"
  def function_two(), do: "ABehaviourFullyImplemented fully implemented function two"
end

defmodule ABehaviourNotFullyImplemented do
  @behaviour ABehaviour

  def function_one(), do: "ABehaviourNotFullyImplemented fully implemented function one"
end

defmodule BehaviourDemo do
  require ABehaviourFullyImplemented
  require ABehaviourNotFullyImplemented

  def main do
    IO.puts ABehaviourFullyImplemented.function_two()
    err = try do
      IO.puts ABehaviourNotFullyImplemented.function_two()
    rescue
      e in UndefinedFunctionError -> e
    end
    IO.inspect err
  end
end

BehaviourDemo.main
"""

defmodule ABehaviour do
  @callback function_one() :: BitString
  @callback function_two() :: BitString
end

defmodule ABehaviourFullyImplemented do
  @behaviour ABehaviour

  def function_one(), do: "ABehaviourFullyImplemented fully implemented function one"
  def function_two(), do: "ABehaviourFullyImplemented fully implemented function two"
end

defmodule ABehaviourNotFullyImplemented do
  @behaviour ABehaviour

  def function_one(), do: "ABehaviourNotFullyImplemented fully implemented function one"
end

defmodule BehaviourDemo do
  require ABehaviourFullyImplemented
  require ABehaviourNotFullyImplemented

  def main do
    IO.puts ABehaviourFullyImplemented.function_two()
    err = try do
      IO.puts ABehaviourNotFullyImplemented.function_two()
    rescue
      e in UndefinedFunctionError -> e
    end
    IO.inspect err
  end
end

BehaviourDemo.main

IO.puts """


Now run io.ex
"""
