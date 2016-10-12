defmodule HanksFirstBirthday.NoteControllerTest do
  use HanksFirstBirthday.ConnCase

  import HanksFirstBirthday.Factory

  test "GET /api/notes renders a list of notes" do
    conn = build_conn
    note = insert(:note)

    conn = get(conn, note_path(conn, :index))

    assert json_response(conn, 200) == render_json("index.json", notes: [note])
  end

  test "GET /api/notes/:id renders chosen note" do
    conn = build_conn
    note = insert(:note)

    conn = get(conn, note_path(conn, :show, note))

    assert json_response(conn, 200) == render_json("show.json", note: note)
  end

  test "POST /api/notes adds a new note" do
    conn = build_conn
    params = %{from: "Jane Smith", body: "Hello!"}

    post(conn, note_path(conn, :create, %{"note" => params}))

    assert Repo.get_by(HanksFirstBirthday.Note, from: "Jane Smith")
  end

  test "POST /api/notes renders the new note" do
    conn = build_conn
    params = %{from: "Jane Smith", body: "Hello!"}

    conn = post(conn, note_path(conn, :create, %{"note" => params}))

    assert json_response(conn, 200)["note"]["from"] == "Jane Smith"
  end

  defp render_json(template, assigns) do
    assigns = Map.new(assigns)

    HanksFirstBirthday.NoteView.render(template, assigns)
    |> Poison.encode!
    |> Poison.decode!
  end
end
