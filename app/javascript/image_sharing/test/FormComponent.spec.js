import 'jsdom-global/register';
import React from 'react';
import assert from 'assert';
import { mount, shallow } from 'enzyme';
import { expect } from 'chai';
import sinon from 'sinon';
import { FormLabelGroup, Button, Input, FormRow } from 'react-gears';

import FormComponent from '../components/FormComponent';

describe('<FormComponent />', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should render correctly', () => {
    const wrapper = shallow(
      <FormComponent />
    );

    expect(wrapper.find('[rowClassName="name"]')).to.have.lengthOf(1);
    expect(wrapper.find('[rowClassName="comment"]')).to.have.lengthOf(1);

    expect(wrapper.find(Button).props()).to.include({
      color: 'primary'
    });
  });
});
