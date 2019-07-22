class OrdersController < ApplicationController
    def index
    @orders = current_user.orders.all
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

        redirect_to orders_path
        else
            
        end
    end
    private

    def orders_params
        
    end
end
