import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/utilities/pdf_viewer/storage/webStorage.dart';
import 'package:Portfolio/utilities/pdf_viewer/url_launcher/web.dart';

class LaunchFile {
  static void launchPDF(
      BuildContext context, String title, String pdfPath, String pdfUrl) async {
    UrlUtils.open(pdfUrl);
  }

  static Future<dynamic> loadFromFirebase(
      BuildContext context, String url) async {
    return FireStorageService.loadFromStorage(context, url);
  }

  static Future<dynamic> createFileFromPdfUrl(dynamic url) async {
    return url;
  }
}