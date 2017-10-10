defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.Accounts


  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: topic_path(conn, :index))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{token: auth.credentials.token,
                    email: auth.info.email,
                    provider: "github"
                   }

    signin(user_params, conn)
  end

  defp signin(user_params, conn) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back")
        |> put_session(:user_id, user.id)
        |> redirect(to: topic_path(conn, :index))
      {:error, reason} ->
        conn
        |> put_flash(:error, "Error sign in failed")
        |> redirect(to: topic_path(conn, :index))
    end
  end

end
