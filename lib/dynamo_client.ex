defmodule DynamoClient do
  alias ExAws.Dynamo

  def put(model, table_name) do
    table_for(table_name)
    |> Dynamo.put_item(model)
  end

  def get(id, table_name) do
    table_for(table_name)
    |> Dynamo.get_item!(%{id: id})
  end

  def get_list(ids, table_name) do
    # TODO: Use DynamoDB query!
    Enum.map(ids, fn(x) -> get(x, table_name) end)
  end

  defp table_for(name) do
    "dev.gm-players.#{name}"
  end
end
