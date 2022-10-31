class Sources::ActiveRecordObject < GraphQL::Dataloader::Source
  def initialize(model_class)
    @model_class = model_class
    @key_name = (@model_class.name.downcase + '_id').to_sym
  end

  def fetch(ids)
    records = @model_class.where(@key_name => ids)
    ids.map { |id| records.find { |r| r.id == id.to_i } }
  end
end