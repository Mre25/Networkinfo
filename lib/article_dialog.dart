import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // تأكد من استيراد الحزمة
import 'article_model.dart';

class ArticleDialog extends StatelessWidget {
  final Article article;

  const ArticleDialog({
    required this.article,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // شريط العنوان
          AppBar(
            title: Text(article.title),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          // محتوى المقالة مع Markdown
          Expanded(
            child: Markdown(
              data: article.content,
              padding: const EdgeInsets.all(16),
              styleSheet: MarkdownStyleSheet(
                tableCellsPadding: const EdgeInsets.all(8),
                tableBorder: TableBorder.all(color: Colors.grey),
                h1: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
                h2: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[700],
                ),
                p: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                listBullet: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
