import 'jsdom-global/register';
import React from 'react';
import assert from 'assert';
import { mount, shallow } from 'enzyme';
import { expect } from 'chai';
import sinon from 'sinon';

import Footer from '../components/Footer';

describe('<Footer />', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should render correctly', () => {
    const wrapper = shallow(
      <Footer />
    );

    expect(wrapper.find('div').text()).to.equal('Copyright: AppFolio Inc. Onboarding');

  });
});
