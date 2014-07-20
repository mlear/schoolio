class UsersController < ApplicationController
  # before_filter :assign_user

  def index
    render 'index'
  end

  def create
    render 'choose_role', params: params
  end
end
