import React from 'react';
import ReactDOM from 'react-dom';
// import ConfigureStore from './store/store'
import * as SessionAPIUtil from './util/api_session_util'

document.addEventListener('DOMContentLoaded', () => {
  //Start Testing
  window.login = SessionAPIUtil.login;
  window.logout = SessionAPIUtil.logout;
  window.signup = SessionAPIUtil.signup;
  win
  //End Testing

  // const store = configureStore();
  const root = document.getElementById('root')
  ReactDOM.render(<h1>Welcome to Satisfy!</h1>, root)
})
// ReactDOM.render(<Root store={store}/>, root)