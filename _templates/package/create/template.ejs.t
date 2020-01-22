---
to: packages/<%= tag %>/src/template.ts
---
<%
  className = h.changeCase.pascal(tag)
-%>
import { html, TemplateResult } from 'lit-element';
import { <%= className %> } from './<%= tag %>';

export default function template(this: <%= className %>): TemplateResult {
  return html``;
}
