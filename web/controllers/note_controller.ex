defmodule HanksFirstBirthday.NoteController do
  use HanksFirstBirthday.Web, :controller

  alias HanksFirstBirthday.Note

  def index(conn, _params) do
    notes = Repo.all(Note)
    render(conn, "index.json", notes: notes)
  end

  def show(conn, %{"id" => id}) do
    note = Repo.get!(Note, id)
    render(conn, "show.json", note: note)
  end

  def create(conn, %{"note" => note_params}) do
    changeset = Note.changeset(%Note{}, note_params)

    case Repo.insert(changeset) do
      {:ok, note} ->
        conn
        |> put_resp_header("location", note_path(conn, :show, note))
        |> render("show.json", note: note)
      {:error, changeset} ->
        render(
          conn,
          HanksFirstBirthday.ChangesetView,
          "error.json",
          changeset: changeset
        )
    end
  end
end
