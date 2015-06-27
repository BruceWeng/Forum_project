class UserProfileController < ApplicationController
  before_action :authenticate_user!, :set_profile, :only =>[:index, :edit, :update]

  private
  def set_profile
    @user = User.find(current_user.id)
    @user.build_profile unless current_user.profile
    @profile = @user.profile
  end

  public
  def index
    @name = @profile.name
    @email = @user.email

  end
  def edit

  end
  def update
    @user.save
    redirect_to :index
  end
end
