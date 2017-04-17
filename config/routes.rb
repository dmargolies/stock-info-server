Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"
  get "/stocks", to: "stocks#index"
  get "/stocks/:stock_id/quotes", to: "quotes#index"
end
