import 'package:device_preview/device_preview.dart';

import 'package:portfolio_website/utilities/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeBlogsData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentPageProvider>(
          create: (context) => CurrentPageProvider(),
        ),
        ChangeNotifierProvider<CurrentProjectIDProvider>(
          create: (context) => CurrentProjectIDProvider(),
        ),
        ChangeNotifierProvider<PDFProvider>(
          create: (context) => PDFProvider(),
        ),
        FutureProvider<Map<String, List<Projects>>>.value(
          value: getProjects(),
        ),
        FutureProvider<List<Testimonials>>.value(
          value: getTestimonials(),
        ),
      ],
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        title: 'Portfolio - Alister Luiz',
        theme: Provider.of<ThemeModel>(context).currentTheme,
        initialRoute: Routes.homeView,
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
