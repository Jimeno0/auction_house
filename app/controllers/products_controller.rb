class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy

  end

  def new
    @user = User.find(params[:user_id])
    @products = @user.products.new
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new(
    title: params[:product][:title],
    description: params[:product][:description],
    deadline: params[:product][:deadline],
    )
    @product.save
    redirect_to "/users"
  end
end
