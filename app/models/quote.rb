#model with no db, see
#https://github.com/rails-api/active_model_serializers/blob/master/docs/howto/serialize_poro.md
class Quote
  alias :read_attribute_for_serialization :send
  attr_accessor :trade_date, :open, :close, :high, :low, :id

  def initialize(attributes)
    @trade_date = attributes[:trade_date]
    @open = attributes[:open]
    @close = attributes[:close]
    @high = attributes[:high]
    @low = attributes[:low]
    #active model serializer appears to need an id, use trade_date
    #because it is unique
    @id = attributes[:trade_date]
  end

  def self.model_name
    @_model_name ||= ActiveModel::Name.new(self)
  end
end
