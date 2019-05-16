defmodule RedditgroupsWeb.Router do
  use RedditgroupsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: RedditgroupsWeb.Schema,
      interface: :simple,
      context: %{pubsub: RedditgroupsWeb.Endpoint}
    )
  end

  # Other scopes may use custom stacks.
  # scope "/api", RedditgroupsWeb do
  #   pipe_through :api
  # end
end
