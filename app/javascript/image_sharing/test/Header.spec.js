import 'jsdom-global/register';
import React from 'react';
import assert from 'assert';
import { mount, shallow } from 'enzyme';
import { expect } from 'chai';
import sinon from 'sinon';

import Header from '../components/Header';

describe('<Header />', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should render correctly', () => {
    const wrapper = mount(
      <Header title={'hello'}/>
    );

    expect(wrapper.find('h3').text()).to.equal('hello');

  });

});
