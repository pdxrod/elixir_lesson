#! /usr/bin/env elixir

IO.puts """

with clause

opts = %{width: 10, height: 15}
IO.inspect with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, height} <- Map.fetch(opts, :height),
     do: {:ok, width * height}
"""
opts = %{width: 10, height: 15}
IO.inspect with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, height} <- Map.fetch(opts, :height),
     do: {:ok, width * height}

IO.puts """


IO.inspect with {:ok, width} <- Map.fetch(opts, :width),
      {:ok, depth} <- Map.fetch(opts, :depth),
      do: {:ok, width * depth}
"""
IO.inspect with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, depth} <- Map.fetch(opts, :depth),
     do: {:ok, width * depth}

IO.inspect """

"""

defmodule Address do
  defstruct street: nil, city: "New York"
end

defmodule Organization do
  defstruct name: nil, address: nil

  def create_organization( params ) do
    %Organization{}
  end
end

defmodule Main do
  def main() do
    result = with organization <- Organization.create_organization({}),
               :ok <- :ok do
               {:ok, organization}
             else
               %{"error" => reason} -> {:error, reason}
               error -> error
             end
    IO.inspect result
  end
end

Main.main()
