class V1::UsersController < ApplicationController
  def create
    authorize @user
    @user = User.new(user_params)

    if @user.save
      render json: @user.as_json(only: [:id, :email]), status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    render json: @user.as_json(only: [:email])
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      render json: @user.as_json(only: [:email])
    else
      head(:unauthorized)
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
