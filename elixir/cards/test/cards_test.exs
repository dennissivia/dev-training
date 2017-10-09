defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck makes 20 cards" do
    assert Cards.create_deck |> length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck

    refute deck == Cards.shuffle(deck)
  end
end
