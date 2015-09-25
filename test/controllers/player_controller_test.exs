defmodule GmPlayers.PlayerControllerTest do
  use GmPlayers.ConnCase

  test "GET /" do
    conn = get conn(), "/api/players"
    assert html_response(conn, 200) =~ "Players#index"
  end
end
