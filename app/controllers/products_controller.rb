class ProductsController < ApplicationController
    before_action :is_admin , only: [ :new, :create, :edit, :update, :destroy ]

    def index
        @products = Product.all
    end

    def show
        puts params
        @products = Product.find(params[:id])
        
    end

    def new
        @product = Product.new
    end

    def create
        puts params

        @product = current_user.products.create(products_params)
        puts @product.valid?
        if @product.save
            redirect_to products_path
        else
            puts "Cant save product"
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        product = Product.find(params[:id])
        product.update(products_params)
            
        redirect_to products
    end

    def destroy
        Product.find(params[:id]).destroy

        redirect_to products_path
    end


    private

    def products_params
        params.require(:product).permit(:name, :price, :pictuer, :discreption)
    end

    def is_admin
       if current_user.admin 
        
        return true
       else
        
        redirect_to products_path
        return false
       end
    end
end
