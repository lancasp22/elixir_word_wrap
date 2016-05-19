defmodule WordWrapTest do
  use ExUnit.Case
  doctest WordWrap

  test "2 letter word" do
    assert WordWrap.wrap("an", 100) == "an\n"
  end

  test "2 words" do
    assert WordWrap.wrap("an an", 100) == "an an\n"
  end

  test "2 words wrapped" do
    assert WordWrap.wrap("an an", 2) == "an\nan\n"
  end

  test "words wrapped where length of word equals width" do
    assert WordWrap.wrap("plum apple pear", 5) == "plum\napple\npear\n"
  end

  test "words wrapped where length of word equals width again" do
    assert WordWrap.wrap("pear apple", 5) == "pear\napple\n"
  end

  test "1 word wrapped" do
    assert WordWrap.wrap("word ", 6) == "word\n"
  end

  test "3 words wrapped" do
    assert WordWrap.wrap("word word word", 6) == "word\nword\nword\n"
  end

  test "3 words wrapped width 11" do
    assert WordWrap.wrap("word word word", 11) == "word word\nword\n"
  end

end
