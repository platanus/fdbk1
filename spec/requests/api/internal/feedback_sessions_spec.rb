require 'rails_helper'

RSpec.describe 'Api::Internal::FeedbackSessionsControllers', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    let(:collection) { JSON.parse(response.body)['feedback_sessions'] }
    let(:params) { {} }

    before do
      create_list(:feedback_session, 5)
      create_list(:feedback_session, 2, receiver: user)
      create_list(:feedback_session, 1, provider: user)
    end

    def perform
      get '/api/internal/feedback_sessions', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it { expect(collection.count).to eq(3) }
      it { expect(response.status).to eq(200) }
    end

    context 'with type param' do
      let(:params) { { type: 'provider' } }

      before do
        sign_in(user)
        perform
      end

      it { expect(collection.count).to eq(1) }
      it { expect(response.status).to eq(200) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end

  describe 'POST /create' do
    let(:provider_user) { create(:user) }
    let(:feedback_session_date) { Time.zone.now.strftime("%Y-%m-%d") }
    let(:tag_names) { ['Tag_1', 'Tag_2'] }
    let(:params) do
      {
        provider_user_id: provider_user.id,
        feedback_session_date: feedback_session_date,
        tag_names: tag_names
      }
    end

    def perform
      post '/api/internal/feedback_sessions', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
      end

      it 'creates a new feedback session' do
        expect { perform }.to change { FeedbackSession.count }.by(1)
      end

      it 'returns a created response' do
        perform
        expect(response.status).to eq(201)
      end
    end

    context 'with unauthenticated user' do
      it 'does not create a new feedback session' do
        expect { perform }.not_to (change { FeedbackSession.count })
      end

      it 'returns an unauthorized response' do
        perform
        expect(response.status).to eq(401)
      end
    end
  end
end
