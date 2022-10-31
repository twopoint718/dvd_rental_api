class Actor < ApplicationRecord
  self.table_name = 'actor'
  has_one :film_actor
  has_many :films
end