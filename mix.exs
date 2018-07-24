defmodule CronTweets.MixProject do
  use Mix.Project

  def project do
    [
      app: :cron_tweets,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :quantum, :extwitter],
      mod: {CronTweets.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.4.11"},
      {:quantum, "~> 1.8"},
      {:extwitter, "~> 0.7.2"},
      {:oauth, github: "tim/erlang-oauth"},
      {:mock, "~> 0.2.0"},
      {:mix_test_watch, "~> 0.2.6"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end