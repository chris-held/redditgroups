defmodule Redditgroups.Repo.Migrations.AddSubredditToGroup do
  use Ecto.Migration

  def change do
    alter table(:groups) do
      add(:subreddits, {:array, :string})
    end
  end
end
