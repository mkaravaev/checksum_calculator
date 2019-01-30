defmodule ChecksumCalculator.Storage do
  use Agent

  @counter_init_value 0

  def start_link(opts) do
    {init_value, opts} = Keyword.pop(opts, :init_value, @counter_init_value)
    Agent.start_link(fn -> {Map.new, init_value} end, opts)
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
    case get_counter() >= position do
      true ->
        Agent.update(__MODULE__, fn({map, counter}) ->
          {Map.update!(map, position, &([&1, val])), counter}
        end)
      false -> {:error, :not_exisiting_position}
    end
  end

  def delete_all do
    Agent.update(__MODULE__, fn(_) ->
      {Map.new, @counter_init_value}
    end)
  end

end
