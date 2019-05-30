defmodule Redditgroups.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field(:name, :string)
    field(:subreddits, {:array, :string})

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :subreddits])
    |> validate_required([:name, :subreddits])
  end
end
