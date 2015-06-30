class UserProfileController < ApplicationController
  before_action :authenticate_user!, :set_profile, :only =>[:show, :edit, :update]

  def show
    @name = @user.profile.name
    @email = @user.email

  end
  def edit
    @name = @user.profile.name
  end

  def update
    @user.update!(profile_params)
    redirect_to :action => :show
  end

  private

  def set_profile
    @user = current_user
    @user.build_profile unless current_user.profile
  end

  def profile_params
    params.require(:user).permit(:name, :profile_attributes => [:name] )
  end

end
