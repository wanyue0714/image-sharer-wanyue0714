class SessionsController < ApplicationController
  def create
    @session_form = SessionForm.new(session_params)
    if @session_form.valid?
      user = User.find_by(email: @session_form)
      redirect_to new_session_path, flash: { success: 'Logged in' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @session_form = SessionForm.new
  end

  private

  def session_params
    params.require(:session_form).permit(:email, :password)
  end
end
