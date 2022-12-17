defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling deck of cards
  """

  @doc """
  Create a new deck of cards
  """
  def create_deck do
    values = ["Ace", "Two","Three","Four","Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle the created deck of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if a certain card is in a deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  @doc """
    Deals some given number of cards
  """
  def deal(deck, many) do
    Enum.split(deck, many)
  end
  @doc """
    Saves the deck in a file
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  @doc """
    Loads a deck from the filename you provide
  """
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

  @doc """
    Create a deck , shuffle, and deal the cards at a given number of hands
  """

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
