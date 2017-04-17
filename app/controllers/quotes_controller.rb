class QuotesController < ApplicationController
  def index
    #lookup by id so we can prevent random browser input from being sent to yahoo
    stock = Stock.find(params[:stock_id])
    yahoo_client = YahooFinance::Client.new

    begin
      data = yahoo_client.historical_quotes(stock.symbol, {
        :start_date => Time::now-(24*60*60*30), end_date: Time::now
      })
    rescue OpenURI::HTTPError => e
      logger.error("HTTP error for historical data for stock #{stock.id}: #{e}")
      #yahoo returns proper http errors (404 when it can't find a symbol)
      #so just send that back
      return render :status => e.io.status[0]
    end

    quotes = []
    data.each do |quote_data|
      quote = Quote.new(quote_data)
      quotes.push(quote)
    end
    render :json => quotes
  end
end
