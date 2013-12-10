class AddTypeToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :type, :string, default: "UnpaidDebt"
  end
end
