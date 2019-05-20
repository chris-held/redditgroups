# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Redditgroups.Repo.insert!(%Redditgroups.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Redditgroups.Groups.Group
alias Redditgroups.Groups.Subreddit
alias Redditgroups.Repo

Repo.delete_all(Subreddit)
Repo.delete_all(Group)

group1 =
  %Group{
    name: "Sports",
    subreddits: [
      %Subreddit{name: "nba"},
      %Subreddit{name: "nbastreams"},
      %Subreddit{name: "nfl"},
      %Subreddit{name: "nflstreams"}
    ]
  }
  |> Repo.insert!()

group2 =
  %Group{
    name: "Nerd Stuff",
    subreddits: [
      %Subreddit{name: "asoiaf"},
      %Subreddit{name: "gameofthrones"},
      %Subreddit{name: "westworld"},
      %Subreddit{name: "gaming"},
      %Subreddit{name: "civ"},
      %Subreddit{name: "masseffect"}
    ]
  }
  |> Repo.insert!()
