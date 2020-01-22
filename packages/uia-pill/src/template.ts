import { html, TemplateResult } from 'lit-element';
import { UiaPill } from './uia-pill';

export default function template(this: UiaPill): TemplateResult {
  return html`
    <p>${this.pill.text}</p>
  `;
}
