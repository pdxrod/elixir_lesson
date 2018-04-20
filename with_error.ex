IO.puts("Different ways with clause handles errors")
IO.puts("opts = %{width: 10, height: 15}")
opts = %{width: 10, height: 15}
IO.puts("with {ok, width} <- Map.fetch(opts, width)")

with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, height} <- Map.fetch(opts, :height),
     do: {:ok, width * height}

# IO.puts "with {ok, width} <- Map.fetch(opts, depth)"
# with {:ok, width} <- Map.fetch(opts, :width),
#      {:ok, depth} <- Map.fetch(opts, :depth),
# do: {:ok, width * height}
IO.puts("do: {:ok, width * depth}")

with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, depth} <- Map.fetch(opts, :depth),
     do: {:ok, width * depth}
