import 'package:firebase/firebase.dart';
import 'package:portfolio_website/utilities/index.dart';

class FireStorageService extends ChangeNotifier {
  // FireStorageService._();

  FireStorageService() {
    initializeApp(
        apiKey: "AIzaSyAoCiUh1LlzZqG7FVEuWa6pJB8jC49oIpU",
        databaseURL: "https://portfolio-c64dd.firebaseio.com/",
        projectId: "portfolio-c64dd",
        storageBucket: "gs://portfolio-c64dd.appspot.com/",
        messagingSenderId: "581155552102");
  }

  static Future<dynamic> loadFromStorage(
      BuildContext context, String image) async {
    var url = await storage().ref(image).getDownloadURL();
    return url;
  }
}
