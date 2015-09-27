defmodule DynamoClient do
  alias ExAws.Dynamo

  def put(model, table_name) do
    table_for(table_name)
    |> Dynamo.put_item(model)
  end

  def get(field_value_map, table_name) do
    table_for(table_name)
    |> Dynamo.get_item!(field_value_map)
  end

  def get_list(field_value_maps, table_name) do
    # TODO: Use DynamoDB query!
    Enum.map(field_value_maps, fn(x) -> get(x, table_name) end)
  end

  defp table_for(resource_name) do
    Application.get_env(:dynamo_db, resource_name)
  end
end
