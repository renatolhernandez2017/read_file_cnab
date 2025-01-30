class Admin::UsersController < ApplicationController
  include AdminCountable
  include Pagy::Backend

  layout "admin"
  before_action :get_user, only: %i[update]

  def index
    @pagy, @users = pagy(User.all.order(:name))

    if params[:query].present?
      @users = @users.search_global(params[:query])
    end

    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      render turbo_stream: turbo_stream.action(:redirect, admin_users_path)
    else
      render turbo_stream: turbo_stream.replace("form_user", partial: "admin/users/form", locals: {user: @user})
    end
  end

  def update
    if @user.update(user_params)
      render turbo_stream: turbo_stream.action(:redirect, admin_users_path)
    else
      render turbo_stream: turbo_stream.replace("form_user", partial: "admin/users/form", locals: {user: @user})
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :role,
      :image
    )
  end

  def get_user
    @user = User.find(params[:id])
  end
end
