defmodule HanksFirstBirthday.PageControllerTest do
  use HanksFirstBirthday.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ HanksFirstBirthday.LayoutView.title
  end
end
