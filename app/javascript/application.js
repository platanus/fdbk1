import { createApp } from 'vue';
import InlineSvg from 'vue-inline-svg';
import { VueQueryPlugin } from '@tanstack/vue-query';
import TheHeader from './components/the-header.vue';
import BaseInput from './components/base-input.vue';
import BaseSelect from './components/base-select.vue';
import BaseButton from './components/base-button.vue';
import BackButton from './components/back-button.vue';
import BaseCheckbox from './components/base-checkbox.vue';
import BaseTitle from './components/base-title.vue';
import UserSession from './components/user-session.vue';
import FeedbackSessions from './components/feedback-sessions.vue';
import FeedbackSessionsNew from './components/feedback-sessions-new.vue';
import SessionComments from './components/session-comments.vue';
import SessionComment from './components/session-comment.vue';
import './css/application.css';

// eslint-disable-next-line max-statements
document.addEventListener('DOMContentLoaded', () => {
  const app = createApp({
    components: {
      TheHeader,
      UserSession,
      FeedbackSessions,
      FeedbackSessionsNew,
      SessionComments,
      SessionComment,
    },
  });

  app.component('InlineSvg', InlineSvg);
  app.component('BaseInput', BaseInput);
  app.component('BaseSelect', BaseSelect);
  app.component('BaseButton', BaseButton);
  app.component('BackButton', BackButton);
  app.component('BaseCheckbox', BaseCheckbox);
  app.component('BaseTitle', BaseTitle);

  app.use(VueQueryPlugin);

  app.component('SessionComment', SessionComment);
  app.mount('#vue-app');

  return app;
});
