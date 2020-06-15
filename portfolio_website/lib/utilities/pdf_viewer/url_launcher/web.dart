import 'dart:html' as html;

class UrlUtils {
  UrlUtils._();

  static void open(String url, {String name}) {
    html.window.open(url, name);
  }
}