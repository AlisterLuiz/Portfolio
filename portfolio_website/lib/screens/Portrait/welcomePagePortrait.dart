import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/utilities/pdf_viewer/launchPDF.dart';
import 'package:Portfolio/widgets/animations/welcomeScreenAnimations.dart';

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
    controller.dispose();
    super.dispose();
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

  ScrollController scrollController = ScrollController();

  Widget build(BuildContext context) {
    return (UniversalPlatform.isWeb)
        ? Scrollbar(
            isAlwaysShown: true,
            controller: scrollController,
            child: getChild(context),
          )
        : getChild(context);
  }

  Container getChild(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: screenWidth(context) * 0.1,
        right: screenWidth(context) * 0.1,
        top: screenHeight(context) * 0.05,
      ),
      child: AnimatedBuilder(
        animation: animation.controller,
        builder: (context, child) => SafeArea(
          child: ListView(
            shrinkWrap: true,
            controller: (UniversalPlatform.isWeb) ? scrollController : null,
            children: [
              FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: animation.imageOpacity.value,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: new BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: getProfilePicture(null, null),
                      ),
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
      ),
    );
  }
}
