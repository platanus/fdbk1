class SessionComment < ApplicationRecord
  belongs_to :feedback_session, class_name: 'FeedbackSession'

  validates :body, presence: true
end

# == Schema Information
#
# Table name: session_comments
#
#  id                  :bigint(8)        not null, primary key
#  body                :text
#  feedback_session_id :bigint(8)        not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_session_comments_on_feedback_session_id  (feedback_session_id)
#
# Foreign Keys
#
#  fk_rails_...  (feedback_session_id => feedback_sessions.id)
#
