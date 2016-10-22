import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import Quote from './components/Quote';

$(function() {
  ReactDOM.render(
    <Quote />,
    document.getElementById('app')
  );
});
