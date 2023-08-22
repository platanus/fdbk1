require 'rails_helper'

RSpec.describe SessionTag, type: :model do
  it 'has a valid factory' do
    expect(build(:session_tag)).to be_valid
  end
end
