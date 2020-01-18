---
to: packages/<%= tag %>/src/template.ts
---
<%
  className = h.changeCase.pascal(tag)
-%>

import {html} from 'lit-element';
import {<%= className %>} from './<%= tag %>';

export default function template(this: <%= className %>) {
  return html`

  `;
}
