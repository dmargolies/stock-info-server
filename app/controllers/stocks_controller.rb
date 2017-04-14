class StocksController < ApplicationController
  def index
    query = params.require(:query)
    stocks = Stock.findLikeName query
    render json: stocks
  end
end
