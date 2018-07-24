defmodule CronTweetsTest do
  use ExUnit.Case
  doctest CronTweets

  test "greets the world" do
    assert CronTweets.hello() == :world
  end
end
