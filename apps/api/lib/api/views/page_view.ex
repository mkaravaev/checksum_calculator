defmodule Api.PageView do
  use Api, :view

  def render("index.json", %{checksum: checksum}) do
    %{checksum: checksum}
  end
end
