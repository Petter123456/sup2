class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
     redirect_to page1_path # '/' something is also possible depending oon where you wanna send them.
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :company, :company_number, :telephone_number)
  end
end
