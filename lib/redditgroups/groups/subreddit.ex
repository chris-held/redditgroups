defmodule Redditgroups.Groups.Subreddit do
  use Ecto.Schema
  import Ecto.Changeset

  alias Redditgroups.Groups.Group

  schema "subreddit" do
    field(:description, :string)
    field(:name, :string)
    belongs_to(:group, Group)
    timestamps()
  end

  @doc false
  def changeset(subreddit, attrs) do
    subreddit
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end
end
