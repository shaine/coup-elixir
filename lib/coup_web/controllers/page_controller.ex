defmodule CoupWeb.PageController do
  use CoupWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
