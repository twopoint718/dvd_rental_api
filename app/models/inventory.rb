class Inventory < ApplicationRecord
  self.table_name = 'inventory'
  belongs_to :film
end