class Admin::WashLogsController < ApplicationController
  before_action :authenticate_user!
  # TODO: Add admin role check

  def create
    user = User.find(params[:user_id])
    user.wash_logs.create!(washed_at: Time.current)
    redirect_to admin_dashboard_path(email: user.email), notice: "#{user.email}님의 세차 기록을 추가했습니다."
  end
end
