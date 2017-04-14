class ApplicationController < ActionController::API
  def index
    render :status => :not_found
  end
end
