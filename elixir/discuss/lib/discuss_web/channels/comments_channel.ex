defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  import Discuss.Discussions


  def join("comments:" <> topic_id_str, _auth_msg, socket) do
    topic_id = String.to_integer(topic_id_str)
    topic    = get_topic!(topic_id)

    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic) }
  end

  def handle_in(_topic_name, %{"content" => content}, socket) do
    topic   = socket.assigns.topic
    user_id = socket.assigns.user_id
    IO.inspect(content)
    channel_name ="comments:#{topic.id}:new"

    case create_comment(topic, user_id, %{content: content}) do
      {:ok, comment} ->
        broadcast!(socket, channel_name, %{comment: comment})
        {:reply, :ok, socket}
      {:error, reason} -> {:reply, {:error, %{errors: reason}}, socket}
    end
  end
end
