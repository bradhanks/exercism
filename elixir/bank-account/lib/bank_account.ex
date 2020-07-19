defmodule BankAccount do
  use Agent
  @opaque account :: pid

  def open_bank() do
    {:ok, pid} = Agent.start_link(fn -> %{account: 0} end)
    pid
  end

  def close_bank(pid) do
    Agent.update(pid, &Map.put(&1, :account, {:error, :account_closed}))
  end

  def balance(pid) do
    Agent.get(pid, &Map.get(&1, :account))
  end

  @spec update(atom | pid | {atom, any} | {:via, atom, any}, any) :: any
  def update(pid, amount) do
    new_state = Agent.get_and_update(pid, fn state -> {state, update_state(state, amount)} end)
    new_state.account
  end

  def update_state( %{account: {:error, :account_closed}} = state, _ ), do: state
  def update_state( %{account: account} = state, amount), do: %{state | account: account + amount}
end
