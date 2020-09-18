# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

   def new
     @user = User.new
   end

  def create
    @user = User.new(user_params)
    if @user.valid?
       @user.save  
       sign_up(resource_name, resource)
      return redirect_to root_path
    else
      render :new
    end
  end






private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
  end
end










