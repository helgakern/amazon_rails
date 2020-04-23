class ProductsController < ApplicationController

    def index
        @products = Product.all.order('updated_at DESC')
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(params.require(:product).permit(:title, :description, :price))
        if @product.save
        redirect_to products_path
        else
        render :new
        end
    end

    def show
        id = params[:id]
        @product = Product.find(id)
        @review = Review.new
        @review = @product.review.order(created_at: :desc)
    end

    def destroy
        id = params[:id]
        @product = Product.find(id)
        @product.destroy
        redirect_to products_path
    end

    def edit
        id = params[:id]
        @product = Product.find(id)
    end

    def update
        id = params[:id]
        @product = Product.find(id)
        if @product.update(params.require(:product).permit(:title, :description, :price))
            redirect_to product_path(@product)
        else
            render :edit
        end
    end
end
