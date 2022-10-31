class Rental < ApplicationRecord
  self.table_name = 'rental'
  belongs_to :customer
  belongs_to :staff
  belongs_to :inventory
  has_one :film, through: :inventory
end