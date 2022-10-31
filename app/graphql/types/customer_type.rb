class Types::CustomerType < Types::BaseObject
  field :customer_id, ID, null: false
  field :store_id, Int, null: false
  field :first_name, String, null: false, method: :first_name
  field :last_name, String, null: false, method: :last_name
  field :email, String, null: false
  field :address_id, Int, null: false
  field :activebool, Boolean, null: false
  field :create_date, String, null: false
  field :last_update, String, null: false
  field :rentals, [Types::RentalType], null: false, method: :rentals
end