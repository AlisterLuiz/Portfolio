import 'package:device_preview/device_preview.dart';
import 'package:portfolio_website/utilities/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(
          create: (BuildContext context) => ThemeModel(),
        ),
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
        FutureProvider<List<Blogs>>.value(
          value: getBlogs(),
        ),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Portfolio - Alister Luiz',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      initialRoute: Routes.homeView,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
