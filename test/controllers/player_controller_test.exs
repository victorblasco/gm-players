defmodule GmPlayers.PlayerControllerTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "GET /" do
    response = conn(:get, "/api/players/1") |> send_request

    assert response.status == 200
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> GmPlayers.Endpoint.call([])
  end
end
