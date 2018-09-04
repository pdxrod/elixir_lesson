#! /usr/bin/env elixir

IO.gets "Hit enter to continue "
IO.puts ""

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

IO.puts """


defmodule Address do
  defstruct street: nil, city: "New York"
end

defmodule Organization do
  defstruct name: "IBM", address: nil

  def create_address( params ) do
    %Address{ street: params[:street] }
  end

  def create_organization( params ) do
    %Organization{ name: params[:name], address: params[:address] }
  end
end

defmodule Main do
  def main(params) do

    address = %Address{}
    organization = %Organization{}
    IO.write "Address - "
    IO.inspect address
    IO.write "Organization - "
    IO.inspect organization

    result = with address <-
                    Organization.create_address(params),
                  {:ok, organization} <-
                    Organization.create_organization( %{ name: "Apple",  address: address } )
             do
                {:ok, %{organization | address: address}}
             else
               %{"error" => reason} -> {:error, reason}
               error -> error
             end
    IO.write "Result - "
    IO.inspect result

  end
end

params = %{street: '1 Broadway'}
result = Main.main( params )
"""

defmodule Address do
  defstruct street: nil, city: "New York"
end

defmodule Organization do
  defstruct name: "IBM", address: nil

  def create_address( params ) do
    %Address{ street: params[:street] }
  end

  def create_organization( params ) do
    %Organization{ name: params[:name], address: params[:address] }
  end
end

defmodule Main do
  def main(params) do

    address = %Address{}
    organization = %Organization{}
    IO.write "Address - "
    IO.inspect address
    IO.write "Organization - "
    IO.inspect organization

    result = with address <-
                    Organization.create_address(params),
                  {:ok, organization} <-
                    Organization.create_organization( %{ name: "Apple",  address: address } )
             do
                {:ok, %{organization | address: address}}
             else
               error -> error
             end
    IO.write "Result - "
    IO.inspect result

  end
end

params = %{street: '1 Broadway'}
result = Main.main( params )

IO.puts ""
IO.puts "Finished"
IO.puts ""
