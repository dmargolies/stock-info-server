class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol
  has_many :quotes do
    link(:related) do
      "/stocks/#{object.id}/quotes"
    end
  end
end
