# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

exchanges = ["amex", "nasdaq", "nyse"]

options = {
  key_mapping: {
    :lastsale => :last_sale,
    :marketcap => :market_cap,
    :ipoyear => :ipo_year,
  },
  :remove_values_matching => /\An\/a\z/
}
exchanges.each do |exchange|
  file = __dir__ + "/" + exchange + ".csv"
  puts file
  SmarterCSV.process(file, options) do |array|
    stock = array.first #not chunked, array has 1 element
    stock[:exchange] = exchange
    Stock.create(array.first)
  end
end
