class ProfileController < ApplicationController
  def show
  end
  def edit
    current_user.digest_frequency = params[:digest_frequency][:digest_frequency]
    current_user.save
    redirect_to('/')
  end
end
