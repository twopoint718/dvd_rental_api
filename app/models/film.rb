class Film < ApplicationRecord
  self.table_name = 'film'
  has_one :film_actor
  has_many :actors, through: :film_actor
end