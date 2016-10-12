defmodule HanksFirstBirthday.Note do
  use HanksFirstBirthday.Web, :model

  schema "notes" do
    field :from, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:from, :body])
    |> validate_required([:from, :body])
  end
end
