defmodule ChecksumCalculator.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {ChecksumCalculator.Storage, init_value: 0, name: ChecksumCalculator.Storage}
    ]

    opts = [strategy: :one_for_one, name: ChecksumCalculator.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
