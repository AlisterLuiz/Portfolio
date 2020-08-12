import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/utilities/pdf_viewer/launchPDF.dart';
import 'package:portfolio_website/widgets/animations/welcomeScreenAnimations.dart';

class WelcomePagePortrait extends StatefulWidget {
  @override
  _WelcomePagePortraitState createState() => _WelcomePagePortraitState();
}

class _WelcomePagePortraitState extends State<WelcomePagePortrait>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  WelcomeScreenAnimation animation;
  @override
  void initState() {
    super.initState();
    getPDF();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    animation = WelcomeScreenAnimation(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  getPDF() {
    LaunchFile.loadFromFirebase(context, file).then(
      (url) => LaunchFile.createFileFromPdfUrl(url).then(
        (f) => setState(
          () {
            final pdfProvider =
                Provider.of<PDFProvider>(context, listen: false);

            if (f is File) {
              pdfProvider.setPathPDF(f.path);
            } else if (url is Uri) {
              pdfProvider.setPDFUrl(url.toString());
            }
          },
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => SafeArea(
        child: ListView(
          children: [
            FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: new BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: getProfilePicture(null, null),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  getName(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                getInfoLinks(context, 2, animation),
              ],
            ),
            SizedBox(height: 20),
            getButtons(context, 2, animation)
          ],
        ),
      ),
    );
  }
}
