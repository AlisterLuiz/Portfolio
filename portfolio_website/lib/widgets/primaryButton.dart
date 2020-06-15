import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/utilities/pdf_viewer/launchPDF.dart';

Container primaryButton(
    BuildContext context,
    int buttonNo,
    IconData icon,
    Color backgroundColor,
    Color textColor,
    double containerWidth,
    String text,
    double textWidth,
    String buttonFunc) {
  return Container(
    width: containerWidth,
    height: 50,
    child: RaisedButton(
      textColor: textColor,
      color: backgroundColor,
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: textWidth,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      onPressed: () {
        if (buttonNo == 1) {
          final pdfProvider = Provider.of<PDFProvider>(context, listen: false);
          (UniversalPlatform.isWeb)
              ? LaunchFile.launchPDF(
                  context,
                  "Resume",
                  pdfProvider.getPathPDF(),
                  "https://firebasestorage.googleapis.com/v0/b/portfolio-c64dd.appspot.com/o/Resume.pdf?alt=media&token=c55a7f5e-2676-42cb-8bca-71120f43850a")
              : LaunchFile.launchPDF(context, "Resume",
                  pdfProvider.getPathPDF(), pdfProvider.getPDFUrl());
          print("URL" + pdfProvider.getPDFUrl());
        }
      },
    ),
  );
}
