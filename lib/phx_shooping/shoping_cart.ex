defmodule PhxShooping.ShopingCart  do
  defstruct [
    count: 0
  ]

  def add(cart) do
    %{cart | count: cart.count + 1}
  end
end
