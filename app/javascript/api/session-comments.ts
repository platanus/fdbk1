import api from './index';

export interface SessionComment {
  id: number;
  body: string;
  feedbackSessionId: number;
}

export default {
  create(body: string, feedbackSessionId: number) {
    const path = `/api/internal/feedback_sessions/${feedbackSessionId}/session_comments`;

    return api({
      method: 'post',
      url: path,
      data: {
        body,
      },
    });
  },
};
