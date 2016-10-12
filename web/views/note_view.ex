defmodule HanksFirstBirthday.NoteView do
  use HanksFirstBirthday.Web, :view

  def render("index.json", %{notes: notes}) do
    %{notes: Enum.map(notes, &note_json/1)}
  end

  def render("show.json", %{note: note}) do
    %{note: note_json(note)}
  end

  def note_json(note) do
    %{
      from: note.from,
      body: note.body,
      inserted_at: note.inserted_at,
      updated_at: note.updated_at
    }
  end
end
