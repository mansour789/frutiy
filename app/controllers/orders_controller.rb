class OrdersController < ApplicationController
    def index
    @orders = Order.all
    end
    def new
        @order = Order.new
    end
    def show
        @order = Order.find(params[:id])
    end

    def create
        if current_user
        @order = current_user.orders.create(product_id: params[:product_id])

        redirect_to order_path(@order)
        else
            
        end
    end
    private

    def orders_params
        
    end
end
