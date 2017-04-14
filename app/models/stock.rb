class Stock < ApplicationRecord
  def self.findLikeName name
    Stock.where("LOWER(name) LIKE LOWER(?)",  "#{sanitize_sql_like(name)}%")
  end
end
