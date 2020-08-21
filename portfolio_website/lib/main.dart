import 'package:Portfolio/widgets/scrollConfig.dart';
import 'package:device_preview/device_preview.dart';
import 'package:Portfolio/utilities/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(
          create: (BuildContext context) => ThemeModel(),
        ),
        ChangeNotifierProvider<CurrentPageProvider>(
          create: (context) => CurrentPageProvider(currentIndex: 0),
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
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
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
