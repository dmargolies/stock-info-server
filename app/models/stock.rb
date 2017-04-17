class Stock < ApplicationRecord
  def self.findLikeName name
    Stock.where("LOWER(name) LIKE LOWER(?)",  "#{sanitize_sql_like(name)}%")
  end
  #serializer handles adding quotes link
  #but we need an attr_accessor (or method) defined
  #attr_accessor :quotes
  def quotes
  end
end
