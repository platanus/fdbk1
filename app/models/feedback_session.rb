class FeedbackSession < ApplicationRecord
  belongs_to :provider, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :session_tags, dependent: :destroy
  has_many :tags, through: :session_tags

  has_many :session_comments, dependent: :destroy

  scope :for_user, ->(user) { where(provider: user).or(where(receiver: user)) }

  validates :session_date, presence: true

  def tag_names=(tag_names)
    self.tags = tag_names.map do |name|
      Tag.find_or_create_by!(name: name)
    end
  end
end

# == Schema Information
#
# Table name: feedback_sessions
#
#  id           :bigint(8)        not null, primary key
#  provider_id  :bigint(8)        not null
#  receiver_id  :bigint(8)        not null
#  session_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_feedback_sessions_on_provider_id  (provider_id)
#  index_feedback_sessions_on_receiver_id  (receiver_id)
#
# Foreign Keys
#
#  fk_rails_...  (provider_id => users.id)
#  fk_rails_...  (receiver_id => users.id)
#
