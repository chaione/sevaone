class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_raven_context
  before_action do
    @application_name = ENV.fetch('CANONICAL_NAME', 'Disaster API')
  end

  def admin?
    user_signed_in? && current_user.admin?
  end

  def authenticate_admin!
    if !admin?
      redirect_to request.referrer || root_path, notice: "Admins Only! :|"
    end
  end

  private

  def set_raven_context
    Raven.user_context(
      id: current_user&.id,
      email: current_user&.email,
      ip_address: request.ip
    )
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    logger.debug current_user.to_json
    logger.debug Raven.user_context
    logger.debug Raven.extra_context
  end
end
