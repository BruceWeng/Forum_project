class UserProfileController < ApplicationController
  before_action :authenticate_user!, :set_profile, :only =>[:show, :edit, :update]

  private
  def set_profile
    @user = User.find(current_user.id)
    @user.build_profile unless current_user.profile
    @profile = @user.profile
  end

  public
  def show
    @name = @profile.name
    @email = @user.email

  end
  def edit
    @name = @profile.name

  end
  def update
    if patams[:_remove_logo] "1"
      @post.logo = nil
    @profile.update!(profile_params)
    redirect_to :action => :show
  end

  def profile_params
    params.require(:user).permit(:name, :profile_attributes)
  end
end
