defmodule RedditgroupsWeb.Resolvers do
  alias Redditgroups.Groups
  alias Redditgroups.Services

  def groups(_root, _args, _info) do
    # TODO: return groups for the current user
    # (or a hardcoded one)
    {:ok, Groups.list_groups()}
  end

  def feed(_root, %{group_id: group_id}, _info) do
    # TODO: return feed for the passed in group
    # get group and map it's subreddits to an array
    # to pass to the reddit service
    group = Groups.get_group!(group_id)
    result = Services.get_reddit_feed(group.subreddits)
    {:ok, result}
  end

  def subreddits(_root, _args, _info) do
    # TODO: return list of subreddits based on
    # some query. Go out to reddit for this
    {:ok, []}
  end

  def create_group(_root, args, _info) do
    Groups.create_group(args)
  end

  def update_group(_root, args, _info) do
    Groups.update_group(Groups.get_group!(args.id), args)
  end

  def delete_group(_root, %{id: id}, _info) do
    group = Groups.get_group!(id)
    Groups.delete_group(group)
  end
end
