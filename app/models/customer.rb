class Customer < ApplicationRecord
  self.table_name = 'customer'
  has_many :rentals
end