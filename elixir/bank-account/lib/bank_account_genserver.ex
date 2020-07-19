defmodule BankAccountGenServer do
  use GenServer
  @opaque account :: pid

  ## Client
  def open_bank() do
    {:ok, pid} = GenServer.start_link(__MODULE__, %{account: 0, value: nil})
    pid
  end
  def balance(pid), do: GenServer.call(pid, :balance)
  def close_bank(pid) do
    GenServer.cast(pid, {:update, {:error, :account_closed}})
  end
  def update(pid, amount) do
    GenServer.cast(pid, {:update, amount} )
    GenServer.call(pid, :balance)
  end

  ## Server
def init(state) do
    { :ok, state }
  end

  def handle_call(:balance, _from, state) do
    {:reply, state.account, state}
  end

  def handle_cast({:update, value}, state) do
    state = %{state | value: value}
    {:noreply, state, {:continue, :update}}
  end

  def handle_continue(:update, %{value: {:error, :account_closed}} = state) do
    {:noreply, %{state | account: state.value}}
  end
  def handle_continue(:update, %{account: {:error, :account_closed}} = state) do
    {:noreply, state}
  end
  def handle_continue(:update, %{account: account} = state) do
    {:noreply, %{state | account: account + state.value}}
  end

end
