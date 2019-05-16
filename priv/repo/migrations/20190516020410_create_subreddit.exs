defmodule Redditgroups.Repo.Migrations.CreateSubreddit do
  use Ecto.Migration

  def change do
    create table(:subreddit) do
      add(:name, :string)
      add(:description, :text)
      add(:group_id, references(:groups))
      timestamps()
    end
  end
end
