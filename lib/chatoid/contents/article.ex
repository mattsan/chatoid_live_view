defmodule Chatoid.Contents.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
