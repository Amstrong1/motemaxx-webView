import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/navigation_controls.dart';
import 'src/web_view_stack.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://institut-motemaxx.com/appiphone'),
      );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      body: WebViewStack(controller: controller),
      bottomNavigationBar: NavigationControls(controller: controller),
    );
  }
}
