defmodule PhxShooping.CartWorker do
  use GenServer

  @doc """
  Start Cart Gen Server
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  @doc """
  GenServer.init/1 callback
  """
  def init(_state) do
    #All nesesary to work
    cart = %PhxShooping.ShopingCart{}
    {:ok, cart}
  end

  def handle_call(:get_count, _from, state) do
    {:reply, {:ok, state}, state}
  end

  def handle_cast(:inc_count, state) do
    update_cart = PhxShooping.ShopingCart.add(state)
    {:noreply, update_cart}
  end
end
