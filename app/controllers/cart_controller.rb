class CartController < ApplicationController
    def create
        id = params[:id].to_i

        unless session[:shopping_cart].include?(id)
            product = Product.find(id)
            session[:shopping_cart] << id
            flash[:notice] = "#{product.product_name} added to cart."
        end

        redirect_to root_path
    end

    def destroy
        id = params[:id].to_i
        session[:shopping_cart].delete(id)
        product = Product.find(id)
        redirect_to root_path
        flash[:notice] = "#{product.product_name} removed from cart."
    end
end
