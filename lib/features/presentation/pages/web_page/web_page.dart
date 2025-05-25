import 'package:flutter/material.dart';
import 'package:movie_tracker/core/constants/strings/app_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.production),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
