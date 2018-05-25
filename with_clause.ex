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
  defstruct street: nil, city: nil
end

defmodule Organization do
  defstruct name: "IBM", address: nil

  def create_organization( params ) do
    %Organization{}
  end

  def create_address( params ) do
    %Address{}
  end
end

params = {}

result = with {:ok, organization} <- Organization.create_organization(params),
           %Organization{address: nil, name: "IBM"} <- Organization.create_address(organization, params) do
           {:ok, %{organization | address: address}}
         else
           {:error, err} -> {:error, err}
         end
IO.inspect result
