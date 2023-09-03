require 'rails_helper'

RSpec.describe 'Api::Internal::SessionCommentsControllers', type: :request do
  let(:provider) { create(:user) }
  let(:feedback_session) { create(:feedback_session) }

  describe 'POST /create' do
    let(:valid_params) do
      {
        body: 'A comment',
        feedback_session_id: feedback_session.id
      }
    end

    def perform
      post "/api/internal/feedback_sessions/#{feedback_session.id}/session_comments",
           params: valid_params
    end

    context 'with authorized user' do
      before do
        sign_in(provider)
      end

      it 'does create a new session comment' do
        expect { perform }.to (change { SessionComment.count }.by(1))
      end

      it 'creates a new session comment' do
        perform
        expect(response.status).to eq(201)
      end
    end

    context 'with unauthenticated user' do
      it 'does not create a new feedback session' do
        expect { perform }.not_to (change { SessionComment.count })
      end

      it 'returns an unauthorized response' do
        perform
        expect(response.status).to eq(401)
      end
    end
  end
end
