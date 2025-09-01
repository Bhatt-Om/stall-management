class NotificationTokensController < ApplicationController
   skip_before_action :verify_authenticity_token

  def create
    
    binding.pry
    
    current_user.notification_tokens.find_or_create_by!(notification_token)
    head :created
  end

  private

  def notification_token
    params.permit(:token, :platform)
  end
end
