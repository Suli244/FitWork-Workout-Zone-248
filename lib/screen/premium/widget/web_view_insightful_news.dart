import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFFWorkoutZone extends StatefulWidget {
  final String url;
  final String title;

  const WebFFWorkoutZone({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WebFFWorkoutZone> createState() => _WebFFWorkoutZoneState();
}

class _WebFFWorkoutZoneState extends State<WebFFWorkoutZone> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
