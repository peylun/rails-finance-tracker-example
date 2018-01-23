class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Stock \"#{params[:stock]}\" not found" unless @stock
    end
    render partial: 'users/result'
  end
  
  def destroy
    user_stock = UserStock.where(user_id: current_user.id, stock_id: @stock.id)
    user_stock.destroy
    flash[:success] =  "Stock \"#{stock.name}\" was successfully removed from your portfolio"
    redirect_to my_portfolio_path
  end
end