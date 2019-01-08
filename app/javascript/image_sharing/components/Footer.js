import React, { Component } from 'react';
import { Container, Col } from 'react-gears';

class Footer extends Component {
  /* Implement your Footer component here */
  render() {
    const divStyle = {
      fontSize: '10px'
    };
    return (
      <Container>
        <Col sm="12" md={{ size: 6, offset: 5 }}>
          <div style={divStyle} className='footer'> 
            Copyright: AppFolio Inc. Onboarding
          </div>
        </Col>
      </Container>
    ) 
  }
}

export default Footer;
