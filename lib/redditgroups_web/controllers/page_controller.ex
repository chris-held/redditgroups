defmodule RedditgroupsWeb.PageController do
  use RedditgroupsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
