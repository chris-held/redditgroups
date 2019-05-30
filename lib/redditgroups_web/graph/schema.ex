defmodule RedditgroupsWeb.Schema do
  use Absinthe.Schema

  alias RedditgroupsWeb.Resolvers

  object :group do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:subreddits, non_null(list_of(:string)))
  end

  object :thread do
    field(:url, non_null(:string))
    field(:title, non_null(:string))
    field(:image_url, :string)
    field(:subreddit, :string)
  end

  query do
    field :groups, list_of(:group) do
      resolve(&Resolvers.groups/3)
    end

    field :feed, list_of(:thread) do
      arg(:group_id, non_null(:id))
      resolve(&Resolvers.feed/3)
    end

    field :subreddits, list_of(:string) do
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

    field :delete_group, :group do
      arg(:id, non_null(:id))

      resolve(&Resolvers.delete_group/3)
    end
  end
end
