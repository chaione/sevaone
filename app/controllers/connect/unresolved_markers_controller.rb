class Connect::UnresolvedMarkersController < ApplicationController
  before_action :authenticate_admin!
  helper_method :fields

  def index
    @unresolved_markers = ::Connect::Marker.unresolved.not_flagged.needs.order(:created_at)
  end

  def show
    @unresolved_marker = ::Connect::Marker.find(params[:id])
  end

  def update
    ::Connect::Marker.find(params[:id]).update!(resolved: true)
    logger.info "#{current_user.email} marked marker[#{params[:id]}] as resolved."
    redirect_to connect_unresolved_markers_url, notice: 'Marker resolved.'
  end

  # def destroy
  #   ::Connect::Marker.find(params[:id]).clear_inappropriate_flag!
  #   logger.info "#{current_user.email} cleared marker[#{params[:id]}]."
  #   redirect_to connect_flagged_markers_url, notice: 'Marker cleared.'
  # end

  private

  def fields
    %w(created_at name phone address categories)
  end
end
