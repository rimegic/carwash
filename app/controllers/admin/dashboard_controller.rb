class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  # TODO: Add admin role check

  def index
    if params[:email].present?
      @user = User.find_by(email: params[:email])
    end
    @daily_signups = DailySignup.order(:date)
  end
end
