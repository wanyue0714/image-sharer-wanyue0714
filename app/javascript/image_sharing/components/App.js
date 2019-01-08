import React, { Component } from 'react';
import { inject } from 'mobx-react';
import Header from './Header';
import FormComponent from './FormComponent';
import Footer from "./Footer";

class App extends Component {
  /* Add Prop Types check*/
  render() {
    return (
      <div>
        <Header title={'Tell us what you think'} />
        <FormComponent />
        <Footer />
      </div>
    )
  }
}

export default inject(
  'stores'
)(App);
