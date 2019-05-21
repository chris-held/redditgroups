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
    result = Services.get_reddit_feed(["mkebucks", "nba"])
    {:ok, result}
  end

  def subreddits(_root, _args, _info) do
    # TODO: return list of subreddits based on
    # some query. Go out to reddit for this
    {:ok, []}
  end

  def create_group(_root, args, _info) do
    {:ok, Groups.create_group_with_subreddits(args)}
  end

  def update_group(_root, args, _info) do
    # TODO: implementation
    {:ok,
     %{
       id: args.id,
       name: args.name,
       subreddits: Enum.map(args.subreddits, fn o -> %{name: o} end)
     }}
  end
end
