class ProductsController < ApplicationController
    # Making  the Admin can accesse these methodes, and he is the only one who can edit 
    # or change products
    before_action :is_admin , only: [ :new, :create, :edit, :update, :destroy, :change ]

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def change
        @products = Product.all
    end
    
    def new
        @product = Product.new
    end

    def create
        @product = current_user.products.create(products_params)
        if @product.save
            redirect_to products_path
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        product = Product.find(params[:id])
        product.update(products_params) 
        redirect_to change_path
    end

    def destroy
        Product.find(params[:id]).destroy
        redirect_to change_path
    end
    


    private

    def products_params
        params.require(:product).permit(:name, :price, :pictuer, :discreption)
    end

    # check if admin log in
    def is_admin
       if current_user.admin 
            return true
       else
            redirect_to new_user_session_path
            return false
       end
    end

    
end
