defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "Two","Three","Four","Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, many) do
    Enum.split(deck, many)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # Original aproach code
    # {status, binary} = File.read(filename)
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "The file provided does not exist"
    # end

    # More pattern matching and handling unused variables with a prefix of underscore
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "The file provided does not exist"
    end
  end

  def create_hand(hand_size) do
    # Without the pipe operator
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # Cards.deal(deck, hand_size)

    # With the pipe operator and
    # be keen because pipe operator always passes the results to the next func as the first argument
    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end

end
