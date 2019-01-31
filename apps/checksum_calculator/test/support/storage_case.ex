defmodule ChecksumCalculator.StorageCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnit.Case

      setup do
        on_exit fn ->
          ChecksumCalculator.Storage.delete_all
        end
      end

      def generate_storage(context) do
        for i <- [1,2,333,444,55453,3] do
          ChecksumCalculator.Storage.push(i)
        end

        :ok
      end

    end
  end
end
