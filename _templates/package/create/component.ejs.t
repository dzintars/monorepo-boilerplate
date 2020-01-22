---
to: packages/<%= tag %>/src/<%= tag %>.ts
---
<%
  className = h.changeCase.pascal(tag)
-%>
import { LitElement, customElement, TemplateResult } from 'lit-element';
import style from './style';
import template from './template';

declare global {
  interface HTMLElementTagNameMap {
    '<%= tag %>': <%= className %>;
  }
}

@customElement('<%= tag %>')
export class <%= className %> extends LitElement {
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
