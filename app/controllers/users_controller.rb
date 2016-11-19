class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, flash: { success: 'Created user' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password,
                                 :password_confirmation)
  end
end
