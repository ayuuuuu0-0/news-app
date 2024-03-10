import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(246, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 238, 238),
        title: Text(
          "News",
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins SemiBold',
              fontSize: 30),
        ),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Container(
          child: WebView(
        initialUrl: widget.blogUrl,
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
