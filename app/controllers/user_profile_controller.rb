class UserProfileController < ApplicationController
  before_action :set_profile, :only =>[:edit, :update]

  private
  def set_profile
    @user = User.find.params[:id]
    @profile = @user.profile
  end

  public
  def edit

  end
  def update

  end
end
