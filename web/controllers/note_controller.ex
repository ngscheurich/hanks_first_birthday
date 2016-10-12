defmodule HanksFirstBirthday.NoteController do
  use HanksFirstBirthday.Web, :controller

  alias HanksFirstBirthday.Note

  def index(conn, _params) do
    notes = Repo.all(Note)
    render(conn, "index.json", notes: notes)
  end
end
