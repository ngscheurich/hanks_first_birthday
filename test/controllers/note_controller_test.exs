defmodule HanksFirstBirthday.NoteControllerTest do
  use HanksFirstBirthday.ConnCase
  import HanksFirstBirthday.Factory

  test "index/1 renders a list of notes" do
    conn = build_conn
    note = insert(:note)

    conn = get(conn, note_path(conn, :index))

    assert json_response(conn, 200) == render_json("index.json", notes: [note])
  end

  test "show/2 renders chosen note" do
    conn = build_conn
    note = insert(:note)

    conn = get(conn, note_path(conn, :show, note))

    assert json_response(conn, 200) == render_json("show.json", note: note)
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    HanksFirstBirthday.NoteView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end
