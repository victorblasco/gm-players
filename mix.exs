defmodule GmPlayers.Mixfile do
  use Mix.Project

  def project do
    [app: :gm_players,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {GmPlayers, []},
     applications: [
       :phoenix,
       :phoenix_html,
       :cowboy,
       :logger,
       :ex_aws,
       :httpoison
     ]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.0.2"},
     {:phoenix_html, "~> 2.1"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:cowboy, "~> 1.0"},
     {:sweet_xml, "~> 0.2.1"}, # ex_aws dependency
     {:ex_aws, "~> 0.4.10"},
     {:poison, "~> 1.2"},
     {:httpoison, "~> 0.7"}]
  end
end
