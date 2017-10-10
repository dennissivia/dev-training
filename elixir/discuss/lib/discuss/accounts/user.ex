defmodule Discuss.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.Accounts.User


  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
