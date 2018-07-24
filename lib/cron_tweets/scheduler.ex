defmodule CronTweets.Scheduler do
    def schedule_file(schedule, filepath) do
        Quantum.add_job(schedule, fn ->
            CronTweets.FileReader.get_strings_to_tweet(filepath)
            |> CronTweets.TweetServer.tweet()
        end)
    end
end
