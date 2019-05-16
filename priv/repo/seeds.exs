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

%Group{name: "Test Group"} |> Repo.insert!()
%Group{name: "Another Test Group"} |> Repo.insert!()
