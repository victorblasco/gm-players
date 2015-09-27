defmodule Player do
  alias ExAws.Dynamo

  @derive [ExAws.Dynamo.Encodable]
  defstruct [:player_id, :public_name]

  def create(player_attrs) do
    Map.merge(%Player{}, player_attrs)
    |> DynamoClient.put(:players)
  end

  def find(id) do
    DynamoClient.get(%{player_id: id}, :players)
    |> Dynamo.Decoder.decode(as: Player)
  end

  def find_by_ids(ids) do
    Enum.map(ids, fn(x) -> %{player_id: x} end)
    |> DynamoClient.get_list(:players)
    |> Enum.map(fn(x) -> Dynamo.Decoder.decode(x, as: Player) end)
  end
end
