defmodule Puzzle001 do
  @moduledoc """
  Documentation for `Puzzle001`.
  """

  def main(filename) do
    filename
    |> load_puzzle
    |> String.split("\n", trim: :true)
    |> calc_depth_measurement
  end

  def load_puzzle(filename) do
    case File.read(filename) do
      {:ok, binary} -> binary
      {:error, _reason} -> "That file doesn't exist welp 🥲"
    end
  end

  def calc_depth_measurement(depth_list) do
    depth_list
    |>Enum.map(&String.to_integer/1)
    |> Enum.chunk_every( 2, 1, :discard)
    |> Enum.filter(fn [left, right] ->
      right > left
    end
    )
    |> length
  end
end
