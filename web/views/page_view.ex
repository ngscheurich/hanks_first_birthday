defmodule HanksFirstBirthday.PageView do
  use HanksFirstBirthday.Web, :view

  use Timex

  def days_old do
    now = Timex.now("America/Chicago")
    bday = Timex.parse!("2015-10-25T14:30-06:00", "{ISO:Extended}")
    Interval.new(from: bday, until: now)
    |> Interval.duration(:days)
  end
end
