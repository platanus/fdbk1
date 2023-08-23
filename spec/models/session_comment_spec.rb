require 'rails_helper'

RSpec.describe SessionComment, type: :model do
  it 'has a valid factory' do
    expect(build(:session_comment)).to be_valid
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'Associations' do
    subject(:session_comment) { build(:session_comment) }

    it { expect(session_comment).to belong_to(:feedback_session) }
  end
end
