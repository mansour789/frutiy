class OrdersController < ApplicationController
    before_action :is_hem , only: [:show]
    
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

    def is_hem
        if current_user.id == Order.find(params[:id]).user_id
        else
            redirect_to home_path
        end
    end
end
