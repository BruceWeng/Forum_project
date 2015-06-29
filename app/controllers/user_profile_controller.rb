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
    @profile.update(params.require(:profile).permit(:name))
    redirect_to :action => :show
  end
end
