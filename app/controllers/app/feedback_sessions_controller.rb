class App::FeedbackSessionsController < App::BaseController
  def index
    @provider_sessions = current_user.providers.includes(:provider, :receiver)
  end

  def new
    @feedback_session = FeedbackSession.new
  end
end
