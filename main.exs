defmodule Main do
  def run do
    cards = Card.load_cards("data/cards.csv")
    Enum.each cards, fn card ->
      card
      |> ask_question
      |> check_guess(card[:answer])
      |> give_feedback(card[:answer])
    end
  end

  defp ask_question(card) do
    question = card[:question] <> " "
    IO.gets(question) |> String.trim
  end

  defp check_guess(guess, answer) do
    guess == answer
  end

  defp give_feedback(correct, answer) do
    if correct do
      IO.puts "Correct!"
    else
      IO.puts "Incorrect. The correct answer was #{answer}"
    end
  end
end

Main.run
