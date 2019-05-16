defmodule RedditgroupsWeb.Schema do
  use Absinthe.Schema

  alias RedditgroupsWeb.Resolvers

  object :group do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:subreddits, non_null(list_of(non_null(:subreddit))))
  end

  object :subreddit do
    field(:name, non_null(:string))
    filed(:description, :string)
  end

  object :thread do
    field(:url, non_null(:string))
    field(:title, non_null(:string))
    field(:image_url, :string)
    field(:subreddit, :subreddit)
  end

  query do
    field :groups, list_of(:group) do
      resolve(&Resolvers.groups/3)
    end

    field :feed, list_of(:thread) do
      resolve(&Resolvers.feed/3)
    end

    field :subreddits, list_of(:subreddit) do
      resolve(&Resolvers.subreddits/3)
    end
  end

  mutation do
    field :create_group, :group do
      arg(:name, non_null(:string))
      arg(:subreddits, non_null(list_of(:string)))

      resolve(&Resolvers.create_group/3)
    end

    field :update_group, :group do
      arg(:id, non_null(:id))
      arg(:name, non_null(:string))
      arg(:subreddits, non_null(list_of(:string)))

      resolve(&Resolvers.update_group/3)
    end
  end
end
