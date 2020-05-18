import 'package:portfolio_website/utilities/index.dart';

class Routes {
  Routes._();

  //static variables
  static const String navigation = '/navigation';
  static const String welcome = '/welcome';
  static const String project = '/project';
  static const String blog = '/blog';
  static const String about = '/about';
  static const String testimonials = '/testimonials';

  static final routes = <String, WidgetBuilder>{
    navigation: (BuildContext context) => NavigationBar(),
    welcome: (BuildContext context) => WelcomePage(),
    project: (BuildContext context) => ProjectsPage(),
    blog: (BuildContext context) => BlogPage(),
    testimonials: (BuildContext context) => TestimonialsPage(),
    about: (BuildContext context) => AboutPage(),
  };
}
