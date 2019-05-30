defmodule Redditgroups.Repo.Migrations.RemoveSubredditTable do
  use Ecto.Migration

  def change do
    drop(table(:subreddit))
  end
end
