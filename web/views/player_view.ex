defmodule GmPlayers.PlayerView do
  use GmPlayers.Web, :view

  def render("index.json", %{players: players}) do
    %{players: render_many(players, GmPlayers.PlayerView, "player.json")}
  end

  def render("show.json", %{player: player}) do
    %{player: render_one(player, GmPlayers.PlayerView, "player.json")}
  end

  def render("player.json", %{player: player}) do
    %{
      id: player.player_id,
      public_name: player.public_name
    }
  end
end
