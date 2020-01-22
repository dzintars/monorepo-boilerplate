import { LitElement, customElement, property, TemplateResult } from 'lit-element';
import style from './style';
import template from './template';
import { Pill, Styling } from './models';

declare global {
  interface HTMLElementTagNameMap {
    'uia-pill': UiaPill;
  }
}

@customElement('uia-pill')
export class UiaPill extends LitElement {
  public static styles = [style];
  // public static get styles(): CSSResultArray {
  //   return [
  //     GlobalStyle,
  //     Style
  //   ];
  // }

  @property({ type: Object })
  public pill: Pill = {
    text: '',
  };

  @property({ type: Object })
  public styling: Styling = {
    height: '1rem',
    background: '#006AFF',
    color: '#FFFFFF',
  };

  protected render(): TemplateResult {
    console.log('Test');
    return template.call(this);
  }
}
