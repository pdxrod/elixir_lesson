#! /usr/bin/env elixir

IO.puts """

with clause

opts = %{width: 10, height: 15}
with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, height} <- Map.fetch(opts, :height),
     do: {:ok, width * height}


"""
opts = %{width: 10, height: 15}
with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, height} <- Map.fetch(opts, :height),
     do: {:ok, width * height}

IO.puts """
 with {:ok, width} <- Map.fetch(opts, :width),
      {:ok, depth} <- Map.fetch(opts, :depth),
      do: {:ok, width * depth}
"""
with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, depth} <- Map.fetch(opts, :depth),
     do: {:ok, width * depth}
