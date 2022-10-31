class Types::FilmType < Types::BaseObject
  field :title, String, null: false
  field :release_year, String, null: false
  field :rating, String, null: false
  field :actors, [Types::ActorType]
end