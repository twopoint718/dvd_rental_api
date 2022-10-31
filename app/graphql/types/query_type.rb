module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :customer, Types::CustomerType do
      argument :customer_id, ID
    end

    def customer(customer_id:)
      Customer.where(customer_id: customer_id).first
    end
  end
end
