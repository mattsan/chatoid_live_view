defmodule ChatoidWeb.ChatLive do
  use Phoenix.LiveView

  @topic "chat:lobby"

  def mount(_session, socket) do
    ChatoidWeb.Endpoint.subscribe(@topic)
    new_socket = socket |> assign_articles()
    {:ok, new_socket}
  end

  def render(assigns) do
    Phoenix.View.render(ChatoidWeb.ChatView, "index.html", assigns)
  end

  def handle_event("post", %{"body" => body}, socket) do
    Chatoid.Contents.create_article(%{body: body})
    ChatoidWeb.Endpoint.broadcast_from(self(), @topic, "post", %{})

    new_socket = socket |> assign_articles()
    {:noreply, new_socket}
  end

  def handle_info(%{topic: @topic, event: "post"}, socket) do
    articles = Chatoid.Contents.list_articles()

    new_socket = socket |> assign_articles()
    {:noreply, new_socket}
  end

  def handle_info(event, socket) do
    {:noreply, socket}
  end

  defp assign_articles(socket) do
    articles = Chatoid.Contents.list_articles()
    socket
    |> assign(articles: articles)
  end
end
