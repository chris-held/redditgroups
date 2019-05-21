defmodule Redditgroups.Services.Reddit do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, "https://www.reddit.com/r/")
  plug(Tesla.Middleware.JSON)

  def get_feeds(feeds) do
    # TODO: - get a list for each feed
    # a feed object will need a name, and optional
    # pagination stuff (maybe add that later)
    # these will have to be pulled down
    # async and ordered by date
    Enum.flat_map(feeds, fn feed ->
      {:ok, response} = get("#{feed.name}.json")

      Enum.map(response.body["data"]["children"], fn o ->
        %{
          title: o["data"]["title"],
          url: o["data"]["url"],
          score: o["data"]["score"],
          subreddit: o["data"]["subreddit"]
        }
      end)
    end)
    |> Enum.sort_by(fn o -> o.score end, &>=/2)
  end
end
