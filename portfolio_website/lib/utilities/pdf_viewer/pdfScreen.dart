import 'package:Portfolio/utilities/index.dart';

class PDFScreen extends StatelessWidget {
  final String title;
  final String pdfPath;
  final String pdfUrl;
  PDFScreen(this.title, this.pdfPath, this.pdfUrl);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.share),
          //     onPressed: () {},
          //   ),
          // ],
        ),
        path: pdfPath);
  }
}
