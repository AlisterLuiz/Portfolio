import 'package:Portfolio/utilities/index.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => NavBarPortrait(),
          landscape: (context) => NavBarLandscape(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => NavBarPortrait(),
          landscape: (context) => NavBarLandscape(),
        ),
        desktop: OrientationLayout(
          portrait: (context) => NavBarPortrait(),
          landscape: (context) => NavBarLandscape(),
        ),
      ),
    );
  }
}
