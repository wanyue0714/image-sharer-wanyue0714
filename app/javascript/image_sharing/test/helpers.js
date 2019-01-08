import jsdom from 'jsdom-global';
import nock from 'nock';
import Enzyme from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import fetch from 'node-fetch';

//
// Disable any real network requests
//
nock.disableNetConnect();

//
// Set up the DOM
//
jsdom(undefined, { url: 'https://example.appfolio.com' });

//
// Use the Fetch polyfill
//
global.fetch = fetch;


Enzyme.configure({ adapter: new Adapter() });
