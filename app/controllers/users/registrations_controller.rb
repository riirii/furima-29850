# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  #def new
    @user = User.new
  #end

  def create
    @user = User.new()
  end
end
