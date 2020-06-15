import 'package:portfolio_website/utilities/index.dart';

class FireStorageService extends ChangeNotifier {
  // FireStorageService._();
  FireStorageService();

  static Future<dynamic> loadFromStorage(
      BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}