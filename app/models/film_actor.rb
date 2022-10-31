class FilmActor < ApplicationRecord
  self.table_name = 'film_actor'
  belongs_to :film
  belongs_to :actor
end