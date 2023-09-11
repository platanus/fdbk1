class App::SessionCommentsController < App::BaseController
  def new
    feedback_session
  end

  def index
    @session_comments = feedback_session.session_comments
  end

  private

  def feedback_session
    @feedback_session ||= FeedbackSession.find(params[:feedback_session_id])
  end
end
