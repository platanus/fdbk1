class Api::Internal::SessionCommentSerializer < ActiveModel::Serializer
  type :session_comment

  belongs_to :feedback_session, serializer: ::Api::Internal::FeedbackSessionSerializer

  attributes(
    :id,
    :body
  )
end
