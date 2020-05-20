class Api::V1::ProductsController < Api::ApplicationController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    def index
        products = Product.all.order('created_at DESC')
        render json: products
    end

    def show
        product = Product.find params[:id]
        render json: product
    end

    def create
        product = Product.new params.require(:product).permit(:title, :description, :price, :sale_price)
        product.user = current_user
        if product.save
           render json: { id: product.id } 
        else
            render(
                json: { errors: product.errors },
                status: 422
            )
        end
    end

    def update
        product = Product.find params[:id]
        if product.update params.require(:product).permit(:title, :description, :price, :sale_price)
            render json: product
        else
            render(
                json: { errors: product.errors },
                status: 422
            )
        end
    end

    def destroy
        product = Product.find params[:id]
        if product.destroy
            render(
                json: { destroyed: true },
                status: 200
            )
        else
            render(
                JSON: { destroyed: false },
                status: 422
            )
        end
    end
end