class App::FeedbackSessionsController < App::BaseController
  def index
    @provider_sessions = current_user.providers.includes(:provider, :receiver, :tags)
  end

  def new
    @users = User.all
  end
end
