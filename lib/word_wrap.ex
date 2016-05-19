defmodule WordWrap do
  @new_line "\n"

  def wrap(phrase, width) do
    words = String.split(phrase)
    do_wrap(words, width, 0, [""])
    |> Enum.join(@new_line) 
    |> Kernel.<>(@new_line)
  end

  defp do_wrap([], _width, _current_count, result), do: result
  defp do_wrap([first | rest], width, current_count, result) do
    if (String.length(first) + current_count + 1 > width) do
      # string doesn't fit on current line
      result = result ++ [first]
    else
      #string fits on current line
      result = List.update_at(result, -1, &(concat_strings(&1, first)))
    end
    current_count = String.length(List.last(result))
    do_wrap(rest, width, current_count, result)
  end

  defp concat_strings(string1, string2) do
    if (string1 == "") do
      string2
    else
      string1 <> " " <> string2
    end
  end
end
