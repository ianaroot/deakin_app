class AddPaidStatusToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :type, :string, default: "UnpaidDebt"
  end
end
