class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Stock \"#{params[:stock]}\" not found" unless @stock
    end
    render partial: 'users/result'
  end
end