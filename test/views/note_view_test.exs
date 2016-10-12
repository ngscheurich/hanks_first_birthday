defmodule HanksFirstBirthday.NoteViewTest do
  use HanksFirstBirthday.ModelCase
  import HanksFirstBirthday.Factory
  alias HanksFirstBirthday.NoteView

  test "note_json" do
    note = insert(:note)

    rendered_note = NoteView.note_json(note)

    assert rendered_note == %{
      from: note.from,
      body: note.body,
      inserted_at: note.inserted_at,
      updated_at: note.updated_at
    }
  end

  test "index.json" do
    note = insert(:note)

    rendered_notes = NoteView.render("index.json", %{notes: [note]})

    assert rendered_notes == %{
      notes: [NoteView.note_json(note)]
    }
  end

  test "show.json" do
    note = insert(:note)

    rendered_note = NoteView.render("show.json", %{note: note})

    assert rendered_note == %{
      note: NoteView.note_json(note)
    }
  end
end
