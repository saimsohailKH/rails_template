class AuthenticateUser
  include Interactor

  def call
    user = User.authenticate(context.email, context.password)

    if user
      context.user = user
      context.token = user.secret_token
    else
      context.fail!(message: "authenticate_user.failure")
    end
  end
end
