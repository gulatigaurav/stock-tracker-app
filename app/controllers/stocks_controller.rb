class StocksController < ApplicationController

   def search
         if params[:stock]
          @stock = Stock.find_by_ticker(params[:stock])
          @stock ||= Stock.new_from_lookup(params[:stock])
        #  if stock is already searched otherwire it will search for it now
         end
         if @stock
          #  render json: @stock // GOOD WAY TO SEE IF FUNC. IS WORKING
          render partial: 'lookup'
       else
        render status: :not_found , nothing: true
       end

  end

end
