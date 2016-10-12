defmodule HanksFirstBirthday.Factory do
  use ExMachina.Ecto, repo: HanksFirstBirthday.Repo

  def note_factory do
    %HanksFirstBirthday.Note{
      from: "Jane Smith",
      body: "Have a great birthday!"
    }
  end
end
