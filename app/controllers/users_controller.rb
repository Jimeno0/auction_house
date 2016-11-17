class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(
      name: params[:user][:name],
      email: params[:user][:email]
    )

    redirect_to "/users" if user.save

    render "error"
  end

  def show
    puts params.inspect
    @user = User.find(params[:id])


  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to "/users"
  end
end
