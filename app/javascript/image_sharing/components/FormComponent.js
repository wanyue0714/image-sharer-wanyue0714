import React, { Component } from 'react';
import { Container, Row, Button, FormRow, Form, Col, Input } from 'react-gears';
import PropTypes from 'prop-types';

class FormComponent extends Component {
  render() {
    const width = {
      xs: 4,
      md: 6,
      lg: 6
    };
    return (
      <Container>
        <FormRow 
           label='Your Name'
           labelSize='md'
           rowClassName='name'
           width={width}
        />
        <FormRow
          label='Comments'
          type='textarea'
          labelSize='md'
          rowClassName='comment'
          width={width}
        />
        <Row>
      <Col md={{ size: '4', offset: '4' }} lg={{ size: '4', offset: '4' }}>
            <Button color='primary'>Submit</Button>
          </Col>
        </Row>
      </Container>
    )
  }
}

export default FormComponent;
