defmodule HanksFirstBirthday.PageController do
  use HanksFirstBirthday.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
