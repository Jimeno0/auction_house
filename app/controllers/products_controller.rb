class ProductsController < ApplicationController
  def index

  end

  def show

  end

  def destroy

  end

  def new
    @user = User.find(params[:user_id])
    @products = @user.products.new
  end

  def create

  end
end
