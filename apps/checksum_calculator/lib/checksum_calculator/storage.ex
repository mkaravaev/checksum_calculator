defmodule ChecksumCalculator.Storage do
  use Agent

  @counter_init_value 0

  def start_link(_) do
    Agent.start_link(fn -> {Map.new, @counter_init_value} end, name: __MODULE__)
  end

  def get_current_state do
    Agent.get(__MODULE__, & &1)
  end

  def get_counter do
    Agent.get(__MODULE__, fn({_map, counter}) -> counter end)
  end

  def get_storage_map do
    Agent.get(__MODULE__, fn({map, _counter}) -> map end)
  end

  def push(val) do
    Agent.update(__MODULE__, fn({map, counter}) ->
      {Map.put(map, counter + 1, val), counter + 1}
    end)
  end

  def append(position, val) do
    Agent.update(__MODULE__, fn({map, counter}) ->
      {Map.update!(map, position, &([&1, val])), counter}
    end)
  end

  def delete_all do
    Agent.update(__MODULE__, fn(_) ->
      {Map.new, @counter_init_value}
    end)
  end

end
