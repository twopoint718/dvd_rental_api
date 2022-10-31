class DvdRentalApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # For batch-loading (see https://graphql-ruby.org/dataloader/overview.html)
  use GraphQL::Dataloader

  # GraphQL-Ruby calls this when something goes wrong while running a query:
  def self.type_error(err, context)
    # if err.is_a?(GraphQL::InvalidNullError)
    #   # report to your bug tracker here
    #   return nil
    # end
    super
  end

  # Union and Interface Resolution
  def self.resolve_type(abstract_type, obj, ctx)
    # TODO: Implement this method
    # to return the correct GraphQL object type for `obj`
    raise(GraphQL::RequiredImplementationMissingError)
  end

  # Stop validating when it encounters this many errors:
  validate_max_errors(100)

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, type_definition, query_ctx)
    # For example, use Rails' GlobalID library (https://github.com/rails/globalid):
    object.to_gid_param
  end

  def self.object_from_id(node_id, _ctx)
    return unless node_id.present?

    record_class_name, record_id = GraphQL::Schema::UniqueWithinType.decode(node_id)
    record_class = record_class_name.safe_constantize
    record_class&.find_by id: record_id
  end
end
