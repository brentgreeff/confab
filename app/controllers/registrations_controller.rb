class RegistrationsController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(safe_params)

    if @user.save
      # TODO: Send authentication email.
      start_new_session_for @user
      redirect_to root_path, notice: "Successfully signed in!"
    else
      flash.now[:alert] = "Error creating your user account!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def safe_params
    params.require(:user).permit(
      :email_address, :password, :password_confirmation
    )
  end
end
