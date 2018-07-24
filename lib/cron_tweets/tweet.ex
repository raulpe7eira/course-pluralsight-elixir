defmodule CronTweets.Tweet do
    def send(str) do
        ExTwitter.configure(:process, [
            consumer_key: System.get_env("CRON_TWEETS_TWITTER_CONSUMER_KEY"),
            consumer_secret: System.get_env("CRON_TWEETS_TWITTER_CONSUMER_SECRET"),
            access_token: System.get_env("CRON_TWEETS_TWITTER_ACCESS_TOKEN"),
            access_token_secret: System.get_env("CRON_TWEETS_TWITTER_ACCESS_TOKEN_SECRET")
        ])
        ExTwitter.update(str)
    end
end
