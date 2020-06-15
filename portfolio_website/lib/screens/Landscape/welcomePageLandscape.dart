import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/utilities/pdf_viewer/launchPDF.dart';

String file = "Resume.pdf";
String fileName = "Resume";

class WelcomePageLandscape extends StatefulWidget {
  @override
  _WelcomePageLandscapeState createState() => _WelcomePageLandscapeState();
}

class _WelcomePageLandscapeState extends State<WelcomePageLandscape> {
  // static String pathPDF = "";
  // static String pdfUrl = "";
  @override
  void initState() {
    super.initState();
    getPDF();
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
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight(context) * 0.15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth(context) * 0.28,
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
                        left: 235,
                        child: getProfilePicture(400, 400),
                      ),
                      getName(),
                    ],
                  ),
                  getInfoLinks(context, 1),
                ],
              ),
            ),
          ),
          getButtons(context, 1)
        ],
      ),
    );
  }
}
