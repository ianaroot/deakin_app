class UnpaidDebtsController < ApplicationController

def update
  puts params
  debt = UnpaidDebt.find(params[:id])
  debt.record_as_paid
  debt.save!
end
end