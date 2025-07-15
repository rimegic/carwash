class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    # 이전 단계에서 보낸 plan 파라미터를 받음
    plan_name = params[:plan]

    # 기존 구독이 있다면 갱신, 없다면 새로 생성 (멱등성)
    subscription = current_user.subscription || current_user.build_subscription

    subscription.assign_attributes(
      plan_name: plan_name,
      status: 'active',
      expires_at: 1.month.from_now
    )
    subscription.save!
    
    redirect_to dashboard_path, notice: "#{plan_name.capitalize} 플랜 구독이 완료되었습니다."
  end
end
