defmodule RedditgroupsWeb.Resolvers do
  alias Community.News

  def groups(_root, _args, _info) do
    # TODO: return groups for the current user
    # (or a hardcoded one)
    {:ok, []}
  end

  def feed(_root, _args, _info) do
    # TODO: return feed for the current user's groups
    # or specified group. Will need to call out to reddit for this
    {:ok, []}
  end

  def subreddits(_root, _args, _info) do
    # TODO: return list of subreddits based on
    # some query. Go out to reddit for this
    {:ok, []}
  end

  def create_group(_root, args, _info) do
    # TODO: return list of subreddits based on
    # some query. Go out to reddit for this
    {:ok,
     %{id: 1, name: args.name, subreddits: Enum.map(args.subreddits, fn o -> %{name: o} end)}}
  end

  def update_group(_root, args, _info) do
    # TODO: return list of subreddits based on
    # some query. Go out to reddit for this
    {:ok,
     %{
       id: args.id,
       name: args.name,
       subreddits: Enum.map(args.subreddits, fn o -> %{name: o} end)
     }}
  end
end
