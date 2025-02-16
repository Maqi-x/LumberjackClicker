import '../Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';

class MarkdownTextView extends StatelessWidget {
  final String text;

  const MarkdownTextView({super.key, required this.text});

  void _onTapLink(String text, String? href, String title) async {
    if (href != null) {
      final Uri uri = Uri.parse(href.startsWith('http') ? href : 'https://$href');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        log("Error in opening URL ($href)");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalState>(context);
    var textClr = global.darktheme ? Color.fromARGB(255, 240, 235, 235) : Color.fromARGB(237, 0, 4, 7);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: global.darktheme ? Color.fromARGB(97, 0, 0, 0) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: MarkdownBody(
          data: text,
          onTapLink: _onTapLink,
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(fontSize: 16, height: 1.5, color: textClr),
            h1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textClr),
            h2: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textClr),
            h3: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: textClr),
            strong: TextStyle(
              fontWeight: FontWeight.w900,
              color: textClr,
              shadows: [
                Shadow(offset: Offset(-0.7, -0.7), color: Colors.white),
                // Shadow(offset: Offset(0.5, 0.5), color: Colors.white),
              ],
            ),
            em: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
