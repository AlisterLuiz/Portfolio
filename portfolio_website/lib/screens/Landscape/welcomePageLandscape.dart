import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/utilities/pdf_viewer/launchPDF.dart';
import 'package:Portfolio/widgets/animations/welcomeScreenAnimations.dart';

String file = "Resume.pdf";
String fileName = "Resume";

class WelcomePageLandscape extends StatefulWidget {
  @override
  _WelcomePageLandscapeState createState() => _WelcomePageLandscapeState();
}

class _WelcomePageLandscapeState extends State<WelcomePageLandscape>
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
      builder: (context, child) => Padding(
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth(context) * 0.26,
                minWidth: screenWidth(context) * 0.25,
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      textDirection: TextDirection.ltr,
                      alignment: AlignmentDirectional.centerEnd,
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          left: animation.imagePosition.value.dx,
                          child: FadeTransition(
                            opacity: animation.imageOpacity,
                            child: getProfilePicture(450, 450),
                          ),
                        ),
                        Container(
                          height: 250,
                          width: 400,
                          child: getName(),
                        ),
                      ],
                    ),
                    getInfoLinks(context, 1, animation),
                  ],
                ),
              ),
            ),
            getButtons(context, 1, animation)
          ],
        ),
      ),
    );
  }
}
