import { LitElement, customElement, property, CSSResultArray, CSSResult, TemplateResult } from 'lit-element';
import style from './style';
import template from './template';

declare global {
  interface HTMLElementTagNameMap {
    'ui-pill': UiPill;
  }
}

@customElement('ui-pill')
export class UiPill extends LitElement {
  public static styles = [style];
  // public static get styles(): CSSResultArray {
  //   return [
  //     GlobalStyle,
  //     Style
  //   ];
  // }

  protected render(): TemplateResult {
    return template.call(this);
  }
}
