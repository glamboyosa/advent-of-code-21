defmodule Puzzle001 do
  @moduledoc """
  Documentation for `Puzzle001`.
  """

  def main(filename) do
    filename
    |> load_puzzle()
    |> String.split("\n", trim: :true)
    |> calc_depth_measurement()

    {:ok, binary} = File.read("count_array")

    count_array_list = :erlang.binary_to_term(binary)

    # pattern match to remove the count variable

     [count] = count_array_list

     "There are #{count} measurements bigger than the previous 🚀"
  end

  def load_puzzle(filename) do

    case File.read(filename) do
      {:ok, binary} -> binary
      {:error, _reason} -> "That file doesn't exist welp :/"
    end

  end

  def calc_depth_measurement(depth_list) do
    count_array = [0]
    # save the count  array to storage
    binary = :erlang.term_to_binary(count_array)
    File.write("count_array", binary)

    Enum.with_index(depth_list)
    |> Enum.each(fn({_element, index}) ->
      case index - 1 >= 0 do
        true ->
          case Enum.at(depth_list, index) > Enum.at(depth_list, index - 1) do
            true ->
              {:ok, binary} = File.read("count_array")

              count_array_list = :erlang.binary_to_term(binary)

              # pattern match to remove the count variable

              [count] = count_array_list

              updated_count = count + 1

              # save it back to memory

              binary = :erlang.term_to_binary([updated_count])

              File.write("count_array", binary)

            false -> ""
          end
        false -> IO.puts("should be 1? #{index}")
      end
    end)
  end
end
