class OrdersController < ApplicationController
    
    before_action :is_hem , only: [:show]
    before_action :is_admin , only: [ :admin ]

    # All orders for current user
    def index
         @orders = current_user.orders.all.order(created_at: :desc)
    end

    # All orders for all users accese by admin only
    def admin
        @orders = Order.all.order(created_at: :desc)
    end

    # Create order with user_id and product_id this will 
    def create
        if current_user
                @order = current_user.orders.create(product_id: params[:product_id])
                redirect_to orders_path
        end
    end


    # This is for futuer plan to Make user Subscribe for one month
    # these two methodes work fine in development but not tha
    def one_month
        if current_user
            @orders = current_user.orders.all
            @orders.map do |order|
                order.update_attribute(:duration, 4)
                order.save 

                # return create()
            end
            @order = current_user.orders.create(product_id: params[:product_id])
                redirect_to orders_path
        end
    end

    def three_month
        if current_user
            @orders = current_user.orders.all
            @orders.map do |order|
                order.update_attribute(:duration, 12)
                order.save 

                # return create()
            end
            @order = current_user.orders.create(product_id: params[:product_id])
                redirect_to orders_path
        end
    end
    

    # See all orders that has been paid
    def hestory
        @orders = current_user.orders.all.order(created_at: :desc)
    end

    def destroy
        Order.find(params[:id]).destroy
        redirect_to orders_path
    end

    # This methode will be called when user click on payment in order.index
    # it changes the value of paid to be true
    def payment
        @orders = current_user.orders.all
            @orders.map do |order|
                order.update_attribute(:paid, true)
                order.save 
            end
        redirect_to products_path
    end


    private

    # Make the user see just his own orders
    def is_hem
        if current_user.id == Order.find(params[:id]).user_id

        else
            redirect_to home_path
        end
    end

    # Check if user is admin or No
    def is_admin
        if current_user.admin 
            return true
        else
            redirect_to new_user_session_path
            return false
        end
     end

end
