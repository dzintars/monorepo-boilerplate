---
to: packages/<%= tag %>/src/style.ts
---
import {css} from 'lit-element';

export default css`
  :host([hidden]) {
    display: none;
  }
  :host {
      display: block;
  }
`;
