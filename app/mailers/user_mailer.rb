class UserMailer < ApplicationMailer

  def activation_needed_email(user)
    @user = user
    @url  = "https://data.antiquarium.io/users/activate?token=#{user.activation_token}"

    mail to: user.email, subject: 'Antiquarium - Account Activation'
  end

  def activation_success_email(user)
    @user = user
    @url  = "https://data.antiquarium.io/login"

    mail to: user.email, subject: 'Welcome to Antiquarium!'
  end

  def reset_password_email(user)
    @user = user
    @url  = "https://data.antiquarium.io/users/reset_password?token=#{user.reset_password_token}"

    mail to: user.email, subject: 'Antiquarium - Reset Password'
  end

end
