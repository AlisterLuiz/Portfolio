import 'package:portfolio_website/utilities/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio - Alister Luiz',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      initialRoute: Routes.navigation,
      routes: Routes.routes,
    );
  }
}
