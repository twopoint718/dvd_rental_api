class Types::RentalType < Types::BaseObject
  field :rental_id, ID, null: false
  field :rental_date, String, null: false
  field :return_date, String, null: false
  field :film, Types::FilmType, null: false
end