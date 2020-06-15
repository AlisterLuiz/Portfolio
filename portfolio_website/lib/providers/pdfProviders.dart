import 'package:portfolio_website/utilities/index.dart';

class PDFProvider extends ChangeNotifier {
  static String pathPDF = "";
  static String pdfUrl = "";

  setPathPDF(String url) {
    pathPDF = url;
    notifyListeners();
  }

  setPDFUrl(String url) {
    pdfUrl = url;
    notifyListeners();
  }

  String getPathPDF() => pathPDF;
  String getPDFUrl() => pdfUrl;
}
