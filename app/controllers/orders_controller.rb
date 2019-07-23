class OrdersController < ApplicationController
    before_action :is_hem , only: [:show]
    before_action :is_admin , only: [ :admin ]
    
    def index
    @orders = current_user.orders.all
    
    end
    def admin
        @orders = Order.all.order(created_at: :desc)
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

    def edit
        @orders = current_user.orders.all
    end

    def hestory
        @orders = current_user.orders.all.order(created_at: :desc)
    end

    def destroy
        Order.find(params[:id]).destroy

        redirect_to orders_path
    end

    def payment
        @orders = current_user.orders.all
        @orders.map do |order|
            order.update_attribute(:paid, true)
            order.save 
        end
        redirect_to products_path
    end

    private

    def is_hem
        if current_user.id == Order.find(params[:id]).user_id
        else
            redirect_to home_path
        end
    end

    def is_admin
        if current_user.admin 
         return true
        else
         redirect_to new_user_session_path
         return false
        end
     end
end
