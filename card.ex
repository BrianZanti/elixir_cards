defmodule Card do
  def load_cards(filename) do
    filename
    |> File.read!()
    |> split_lines()
    |> remove_last()
    |> split_commas()
    |> make_questions()
  end

  defp split_lines(lines) do
    String.split(lines, "\n")
  end

  defp split_commas(lines) do
    Enum.map lines, fn line ->
      String.split(line, ",")
    end
  end

  defp make_questions(lines) do
    Enum.map lines, fn line ->
      %{question: Enum.at(line, 0), answer: Enum.at(line, 1), category: Enum.at(line, 2)}
    end
  end

  defp remove_last(lines) do
    List.delete_at(lines, length(lines) - 1)
  end
end
