import { LitElement, customElement, TemplateResult } from 'lit-element';
import style from "./style";
import template from "./template";

declare global {
  interface HTMLElementTagNameMap {
    'ui-icon': UiIcon;
  }
}

@customElement('ui-icon')
export class UiIcon extends LitElement {
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
