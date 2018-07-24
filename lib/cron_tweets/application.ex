defmodule CronTweets.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: CronTweets.Worker.start_link(arg)
      # {CronTweets.Worker, arg},
      worker(CronTweets.TweetServer, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CronTweets.Supervisor]
    process = Supervisor.start_link(children, opts)
    CronTweets.Scheduler.schedule_file("* * * * *", Path.join("#{:code.priv_dir(:cron_tweets)}", "sample.txt"))
    process
  end
end
