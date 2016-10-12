defmodule HanksFirstBirthday.NoteView do
  use HanksFirstBirthday.Web, :view

  def render("index.json", %{notes: notes}) do
    %{notes: Enum.map(notes, &note_json/1)}
  end

  defp note_json(note) do
    %{
      id: note.id,
      inserted_at: note.inserted_at,
      updated_at: note.updated_at,
      from: note.from,
      body: note.body
    }
  end
end
