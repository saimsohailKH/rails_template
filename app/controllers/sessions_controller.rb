class SessionsController < ApplicationController
  def create
    result = AuthenticateUser.call(session_params)

    if result.success?
      session[:user_token] = result.token

      redirect_to result.user
    else
      @user = result.user
      flash.now[:message] = t(result.message)

      render :new
    end
  end

  def destroy
    session.delete(:user_token)

    redirect_to root_path, notice: 'You have been logged out.'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
