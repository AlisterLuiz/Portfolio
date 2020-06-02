import 'package:portfolio_website/utilities/index.dart';

class Routes {
  Routes._();

  //static variables
  static const String homeView = '/homeView';
  static const String navigation = '/navigation';
  static const String welcome = '/welcome';
  static const String project = '/project';
  static const String blog = '/blog';
  static const String about = '/about';
  static const String testimonials = '/testimonials';

  static final routes = <String, WidgetBuilder>{
    homeView: (BuildContext context) => HomeView(),
    navigation: (BuildContext context) => NavBarLandscape(),
    welcome: (BuildContext context) => WelcomePageLandscape(),
    project: (BuildContext context) => ProjectsPageLandscape(),
    blog: (BuildContext context) => BlogPageLandscape(),
    testimonials: (BuildContext context) => TestimonialsPageLandscape(),
    about: (BuildContext context) => AboutPageLandscape(),
  };
}
