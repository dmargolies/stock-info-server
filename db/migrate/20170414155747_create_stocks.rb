class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :name
      t.decimal :last_sale
      t.decimal :market_cap
      t.integer :adr_tso
      t.integer :ipo_year
      t.string :sector
      t.string :industry
      t.string :summary_quote
      t.string :exchange
      t.timestamps
    end
  end
end
