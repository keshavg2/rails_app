class ReferralController < ApplicationController
  before_action :authenticate_user!
  before_action do
    validate_user_role!(:referral)
  end
  def index
      @user = User.all
  end
end
