class QuoteSerializer < ActiveModel::Serializer
  attributes :trade_date, :open, :close, :high, :low
end
