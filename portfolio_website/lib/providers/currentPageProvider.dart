import 'package:portfolio_website/utilities/index.dart';

class CurrentPageProvider extends ChangeNotifier {
  int _currentIndex = 0;

  setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}