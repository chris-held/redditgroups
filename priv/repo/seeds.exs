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
alias Redditgroups.Repo

Repo.delete_all(Group)

group1 =
  %Group{
    name: "Sports",
    subreddits: [
      "nba",
      "nbastreams",
      "nfl",
      "nflstreams"
    ]
  }
  |> Repo.insert!()

group2 =
  %Group{
    name: "Nerd Stuff",
    subreddits: [
      "asoiaf",
      "gameofthrones",
      "westworld",
      "gaming",
      "civ",
      "masseffect"
    ]
  }
  |> Repo.insert!()
