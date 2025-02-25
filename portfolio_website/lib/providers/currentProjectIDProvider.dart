import 'package:Portfolio/utilities/index.dart';

class CurrentProjectIDProvider extends ChangeNotifier {
  int _currentIndex = 0;

  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}