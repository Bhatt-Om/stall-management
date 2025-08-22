class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    if resource.super_admin?
      admin_dashboard_path
    elsif resource.stall_admin?
      stall_dashboard_path
    elsif resource.customer?
      customer_dashboard_path
    else
      root_path # fallback
    end
  end
end
