defmodule Redditgroups.GroupsTest do
  use Redditgroups.DataCase

  alias Redditgroups.Groups

  describe "groups" do
    alias Redditgroups.Groups.Group

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Groups.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Groups.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Groups.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Groups.create_group(@valid_attrs)
      assert group.name == "some name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groups.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, %Group{} = group} = Groups.update_group(group, @update_attrs)
      assert group.name == "some updated name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Groups.update_group(group, @invalid_attrs)
      assert group == Groups.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Groups.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Groups.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Groups.change_group(group)
    end
  end

  describe "subreddit" do
    alias Redditgroups.Groups.Subreddit

    @valid_attrs %{description: "some description", name: "some name" group_id: group}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def subreddit_fixture(attrs \\ %{}) do
      {:ok, subreddit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Groups.create_subreddit()

      subreddit
    end

    test "list_subreddit/0 returns all subreddit" do
      subreddit = subreddit_fixture()
      assert Groups.list_subreddit() == [subreddit]
    end

    test "get_subreddit!/1 returns the subreddit with given id" do
      subreddit = subreddit_fixture()
      assert Groups.get_subreddit!(subreddit.id) == subreddit
    end

    test "create_subreddit/1 with valid data creates a subreddit" do
      assert {:ok, %Subreddit{} = subreddit} = Groups.create_subreddit(@valid_attrs)
      assert subreddit.description == "some description"
      assert subreddit.name == "some name"
    end

    test "create_subreddit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groups.create_subreddit(@invalid_attrs)
    end

    test "update_subreddit/2 with valid data updates the subreddit" do
      subreddit = subreddit_fixture()
      assert {:ok, %Subreddit{} = subreddit} = Groups.update_subreddit(subreddit, @update_attrs)
      assert subreddit.description == "some updated description"
      assert subreddit.name == "some updated name"
    end

    test "update_subreddit/2 with invalid data returns error changeset" do
      subreddit = subreddit_fixture()
      assert {:error, %Ecto.Changeset{}} = Groups.update_subreddit(subreddit, @invalid_attrs)
      assert subreddit == Groups.get_subreddit!(subreddit.id)
    end

    test "delete_subreddit/1 deletes the subreddit" do
      subreddit = subreddit_fixture()
      assert {:ok, %Subreddit{}} = Groups.delete_subreddit(subreddit)
      assert_raise Ecto.NoResultsError, fn -> Groups.get_subreddit!(subreddit.id) end
    end

    test "change_subreddit/1 returns a subreddit changeset" do
      subreddit = subreddit_fixture()
      assert %Ecto.Changeset{} = Groups.change_subreddit(subreddit)
    end
  end
end
