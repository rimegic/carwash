class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_status, only: [:index]

  def index
    @wash_logs = current_user.wash_logs.order(washed_at: :desc)
  end

  private

  def check_subscription_status
    redirect_to pricing_path, alert: "구독 정보가 없거나 활성화되지 않았습니다. 먼저 구독해주세요." unless current_user.subscription&.status == 'active'
  end
end
