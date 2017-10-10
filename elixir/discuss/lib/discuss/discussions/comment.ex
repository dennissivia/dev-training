defmodule Discuss.Discussions.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.Discussions.Comment


  schema "comments" do
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
