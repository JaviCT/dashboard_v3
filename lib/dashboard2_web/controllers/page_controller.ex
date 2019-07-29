defmodule Dashboard2Web.PageController do
  use Dashboard2Web, :controller
  import Plug.Conn
  import Dashboard2.Authorize

  plug :user_check when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html", user: current_user_for_vue(conn), csrf_token: get_csrf_token())
  end

  def login(conn, _) do
    case get_session(conn, :user_id) do
      nil -> render(conn, "new.html")
      _ ->
        conn
        |> redirect(to: "/")
    end
  end

  def login_api(conn, _) do
    case get_session(conn, :user_id) do
      nil -> render(conn, "new_api.html")
      _ ->
        conn
        |> redirect(to: "/")
    end
  end

  def logout(conn, _) do
    conn
    |> clear_session
    |> put_flash(:info, "You have logged out.")
    |> redirect(to: "/users/sing_in")
  end

  def create(conn, params) do
    IO.inspect params
    user = User.by_username_or_email(params["email"])
    with true <- user?(user),
         true <- password(params["password"], user)
    do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "You have logged In")
      |> redirect(to: "/")
    else
      {:wrong, username_or_password} ->
        conn
        |> put_flash(:danger, "#{username_or_password} is wrong.")
        |> redirect(to: "/users/sing_in")
    end
  end

  def create_api(conn, params) do
    user = User.by_api_keys(params["user"]["api_id"], params["user"]["api_key"])
    with true <- user?(user)
    do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "You have logged In")
      |> redirect(to: "/")
    else
      {:wrong, username_or_password} ->
        conn
        |> put_flash(:danger, "#{username_or_password} is wrong.")
        |> redirect(to: "/users/sing_in")
    end
  end

  def get_profile(conn, _) do
    user = Evercam.Repo.get!(User, get_session(conn, :user_id))
    logs =
      %{
        "api_id" => user.api_id,
        "api_key" => user.api_key,
        "email" => user.email,
        "firstname" => user.firstname,
        "lastname" => user.lastname,
        "id" => user.id
      }
    conn
    |> put_status(:created)
    |> json(%{
        logs: logs
      })
  end

  defp user?(nil), do: {:wrong, "Email"}
  defp user?(_), do: true

  defp password(password, user) do
    if Comeonin.Bcrypt.checkpw(password, user.password) do
      true
    else
      {:wrong, "Password"}
    end
  end

  defp current_user_for_vue(conn) do
    user = Evercam.Repo.get!(User, get_session(conn, :user_id))
    %{
      username: user.username,
      password: user.password,
      email: user.email,
      user_id: user.id,
      firstname: user.firstname,
      lastname: user.lastname,
      api_id: user.api_id,
      api_key: user.api_key
    } |> Jason.encode!
  end
end
