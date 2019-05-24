defmodule Redditgroups.Groups do
  @moduledoc """
  The Groups context.
  """

  import Ecto.Query, warn: false
  alias Redditgroups.Repo

  alias Redditgroups.Groups.Group
  alias Redditgroups.Groups.Subreddit

  # TODO: should use changesets here to support validation
  @spec create_group_with_subreddits(atom() | %{name: any(), subreddits: any()}) :: any()
  def create_group_with_subreddits(attrs \\ %{}) do
    Repo.insert!(%Group{
      name: attrs.name,
      subreddits: Enum.map(attrs.subreddits, fn s -> %Subreddit{name: s} end)
    })
  end

  @doc """
  Returns the list of groups.

  ## Examples

      iex> list_groups()
      [%Group{}, ...]

  """
  def list_groups do
    Repo.all(Group)
  end

  @doc """
  Gets a single group.

  Raises `Ecto.NoResultsError` if the Group does not exist.

  ## Examples

      iex> get_group!(123)
      %Group{}

      iex> get_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group!(id) do
    Repo.get!(Group, id)
    |> Repo.preload(:subreddits)
  end

  @doc """
  Creates a group.

  ## Examples

      iex> create_group(%{field: value})
      {:ok, %Group{}}

      iex> create_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a group.

  ## Examples

      iex> update_group(group, %{field: new_value})
      {:ok, %Group{}}

      iex> update_group(group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_group(%Group{} = group, attrs) do
    group
    |> Group.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Group.

  ## Examples

      iex> delete_group(group)
      {:ok, %Group{}}

      iex> delete_group(group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_group(%Group{} = group) do
    Repo.delete(group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking group changes.

  ## Examples

      iex> change_group(group)
      %Ecto.Changeset{source: %Group{}}

  """
  def change_group(%Group{} = group) do
    Group.changeset(group, %{})
  end

  @doc """
  Returns the list of subreddit.

  ## Examples

      iex> list_subreddit()
      [%Subreddit{}, ...]

  """
  def list_subreddit do
    Repo.all(Subreddit)
  end

  @doc """
  Gets a single subreddit.

  Raises `Ecto.NoResultsError` if the Subreddit does not exist.

  ## Examples

      iex> get_subreddit!(123)
      %Subreddit{}

      iex> get_subreddit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subreddit!(id), do: Repo.get!(Subreddit, id)

  @doc """
  Creates a subreddit.

  ## Examples

      iex> create_subreddit(%{field: value})
      {:ok, %Subreddit{}}

      iex> create_subreddit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subreddit(attrs \\ %{}) do
    %Subreddit{}
    |> Subreddit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subreddit.

  ## Examples

      iex> update_subreddit(subreddit, %{field: new_value})
      {:ok, %Subreddit{}}

      iex> update_subreddit(subreddit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subreddit(%Subreddit{} = subreddit, attrs) do
    subreddit
    |> Subreddit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Subreddit.

  ## Examples

      iex> delete_subreddit(subreddit)
      {:ok, %Subreddit{}}

      iex> delete_subreddit(subreddit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subreddit(%Subreddit{} = subreddit) do
    Repo.delete(subreddit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subreddit changes.

  ## Examples

      iex> change_subreddit(subreddit)
      %Ecto.Changeset{source: %Subreddit{}}

  """
  def change_subreddit(%Subreddit{} = subreddit) do
    Subreddit.changeset(subreddit, %{})
  end
end
