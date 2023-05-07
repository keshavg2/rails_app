class UserController < ApplicationController
  before_action :authenticate_user!

  before_action do
    validate_user_role!(:admin)
  end

  def admin
    @user = User.where(referred_by_id: current_user.id)
  end

  def send_email

  end

  def send_mail
    email = params[:email]
    user_exist = User.find_by(email:email)
    if(user_exist)
      count = user_exist.action_count.present? ? user_exist.action_count+1 : 1
      user_exist.update!(action_count: count)
    else
      u = User.new(email:email, password:email, referred_by_id: current_user.id, action_count:1)
      u.save!
      u.add_role(:referral)
    end
    if(user_exist.action_count < 5)
    UserMailer.with(email: email).welcome_email.deliver_now
      redirect_to '/user/send_email', flash:{success: "sent the email"}
    else
      redirect_to '/user/send_email', flash:{success: "Resent email is sent max times"}
    end
  end
end
