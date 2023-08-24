FactoryBot.define do
  factory :session_comment do
    body { "MyText" }
    feedback_session
  end
end
