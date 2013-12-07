class AddPaidStatusToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :type, :string, default: "UnpaidDebt"
  end
end
