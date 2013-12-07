class UnpaidDebt < Payment

  def record_as_paid
    self.type = "PaidDebt"
    self.save
  end

end