defmodule PhxShoopingWeb.CartController do
  use PhxShoopingWeb, :controller
  alias PhxShooping.CartAgent
  def add(conn, _params) do
    CartAgent.increment()
    updated_cart = CartAgent.value()
    conn
     |> text("Items: #{updated_cart.count}")
  end

  def index(conn, _params) do
    cart = CartAgent.value()
    render(conn, "index.html", cart: cart)
  end

  def web_inc(conn, _params) do
    CartAgent.increment()
    conn
      |> redirect(to: "/cart")
  end
end
