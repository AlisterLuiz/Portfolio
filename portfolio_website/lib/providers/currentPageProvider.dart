import 'package:Portfolio/utilities/index.dart';

class CurrentPageProvider extends ChangeNotifier {
  int currentIndex;
  CurrentPageProvider({this.currentIndex});
  
  setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  int getIndex() => currentIndex;
}
