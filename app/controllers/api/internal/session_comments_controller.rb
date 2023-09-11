class Api::Internal::SessionCommentsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def create
    respond_with feedback_session.session_comments.create!(comment_params)
  end

  private

  def feedback_session
    @feedback_session ||= FeedbackSession.find(params[:feedback_session_id])
  end

  def comment_params
    params.permit(
      :id,
      :body,
      :feedback_session_id
    )
  end
end
