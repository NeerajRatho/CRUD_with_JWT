class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @user = User.all
    render json: @user, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: { message: "User deleted successfully!" }, status: :ok
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
      render json: {error: e}, status: :not_found
    end
end
