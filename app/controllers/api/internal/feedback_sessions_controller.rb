class Api::Internal::FeedbackSessionsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def index
    sessions = if params[:type].present?
                 filtered_sessions
               else
                 FeedbackSession.for_user(current_user)
               end

    respond_with sessions.includes(:provider, :receiver)
  end

  def create
    respond_with FeedbackSession.create!(
      receiver: current_user,
      provider_id: params[:provider_user_id],
      session_date: params[:feedback_session_date],
      tag_names: params[:tag_names]
    )
  end

  private

  def filtered_sessions
    params[:type] === 'provider' ? current_user.providers : current_user.receivers
  end
end
