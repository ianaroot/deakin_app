# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  eats_house_food :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :eats_house_food, :email, :name, :password, :password_confirmation
  has_secure_password

  has_many :debts_owed, foreign_key: "owed_to_id", class_name: "UnpaidDebt"
  has_many :debts_owing, foreign_key: "owed_from_id", class_name: "UnpaidDebt"
  has_many :owed_users, through: :debts_owing, source: :owed_to
  has_many :owing_users, through: :debts_owed, source: :owed_from
  has_many :expenditures

  before_save { email.downcase! }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def establish_debt_to(other_user, amount)
    self.debts_owing.create!(owed_to_id: other_user.id, amount: amount)
  end

  def add_expenditure(amount, date)
    date = Date.new(date[:year],date[:month],date[:day])
    self.expenditures.create!(amount: amount, date: date)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
