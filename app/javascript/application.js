import { createApp } from 'vue';
import InlineSvg from 'vue-inline-svg';

import TheHeader from './components/the-header.vue';
import BaseInput from './components/base-input.vue';
import BaseButton from './components/base-button.vue';
import BackButton from './components/back-button.vue';
import BaseCheckbox from './components/base-checkbox.vue';
import BaseTitle from './components/base-title.vue';
import UserSession from './components/user-session.vue';
import FeedbackSessions from './components/feedback-sessions.vue';
import FeedbackSessionsNew from './components/feedback-sessions-new.vue';
import './css/application.css';

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp({
    components: {
      TheHeader,
      UserSession,
      FeedbackSessions,
      FeedbackSessionsNew,
    },
  });

  app.component('InlineSvg', InlineSvg);

  app.component('BaseInput', BaseInput);
  app.component('BaseButton', BaseButton);
  app.component('BackButton', BackButton);
  app.component('BaseCheckbox', BaseCheckbox);
  app.component('BaseTitle', BaseTitle);
  app.mount('#vue-app');

  return app;
});
