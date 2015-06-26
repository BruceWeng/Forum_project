class UserProfileController < ApplicationController
  before_action :set_profile, :only =>[:edit, :update]

  private
  def set_profile
    @profile = current_user.profile
  end
  def edit

  end
  def update

  end
end
