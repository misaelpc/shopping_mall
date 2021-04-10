defmodule PhxShoopingWeb.PageController do
  use PhxShoopingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
