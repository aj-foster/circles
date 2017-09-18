defmodule Circles.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Circles.Account.User

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "account_users" do
    field :avatar, :string
    field :background, :string
    field :handle, :string
    field :twitter_id, :integer
    field :token, :string, virtual: true
    field :x, :integer, virtual: true, default: 0
    field :y, :integer, virtual: true, default: 0
    field :dir, :string, virtual: true, default: "right"

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:background, :avatar, :handle, :twitter_id])
    |> validate_required([:background, :avatar, :handle, :twitter_id])
  end
end
