class Api::Internal::FeedbackSessionSerializer < ActiveModel::Serializer
  type :feedback_session

  belongs_to :provider, serializer: ::Api::Internal::UserSerializer
  belongs_to :receiver, serializer: ::Api::Internal::UserSerializer
  has_many :tags, serializer: ::Api::Internal::TagSerializer
  has_many :session_comments, serializer: ::Api::Internal::SessionCommentSerializer

  attributes(
    :id,
    :session_date
  )
end
