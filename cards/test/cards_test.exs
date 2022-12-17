defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck returns 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "hand given length must be equal to the hand returned" do
    {hand, _rest} = Cards.create_deck |> Cards.shuffle |> Cards.deal(5)
    hand_length = length(hand)
    assert hand_length == 5
  end

  test "check if cards are shuffled" do
    deck = Cards.create_deck
    shuffled_deck = Cards.shuffle(deck)
    # assert deck != shuffled_deck
    refute deck == shuffled_deck
  end
end
