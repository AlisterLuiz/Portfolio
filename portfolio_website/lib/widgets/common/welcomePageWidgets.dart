import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/utilities/pdf_viewer/launchPDF.dart';

Image getProfilePicture(double height, double width) {
  return Image.asset('assets/images/profile.png', height: height, width: width);
}

Column getName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Alister',
        style: TextStyle(
          fontSize: 100,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        'Luiz.',
        style: TextStyle(
          fontSize: 100,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Column getInfoLinks(BuildContext context, int pos) {
  return Column(
    crossAxisAlignment:
        (pos == 1) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Container(
        height: 10,
        width: 60,
        color: Theme.of(context).accentColor,
      ),
      SizedBox(height: 20),
      Container(
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  launchURL('https://github.com/AlisterLuiz');
                },
                child: Icon(FontAwesomeIcons.github)),
            InkWell(
                onTap: () {
                  launchURL('https://www.linkedin.com/in/alisterluiz/');
                },
                child: Icon(FontAwesomeIcons.linkedinIn)),
            InkWell(
                onTap: () {
                  launchURL('https://www.instagram.com/alister_luiz/');
                },
                child: Icon(FontAwesomeIcons.instagram)),
          ],
        ),
      ),
    ],
  );
}

Container getButtons(BuildContext context, int width) {
  return Container(
    width: (width == 1) ? screenWidth(context) * 0.32 : null,
    child: FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Flutter Developer and \nAspiring Data Scientist based in\nDubai',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 30,
          ),
          primaryButton(
              context,
              FontAwesomeIcons.fileDownload,
              Theme.of(context).primaryColor,
              Theme.of(context).scaffoldBackgroundColor,
              400,
              "Get my Resume!".toUpperCase(),
              null, () {
            final pdfProvider =
                Provider.of<PDFProvider>(context, listen: false);
            (UniversalPlatform.isWeb)
                ? LaunchFile.launchPDF(
                    context,
                    "Resume",
                    pdfProvider.getPathPDF(),
                    "https://firebasestorage.googleapis.com/v0/b/portfolio-c64dd.appspot.com/o/Resume.pdf?alt=media&token=c55a7f5e-2676-42cb-8bca-71120f43850a")
                : LaunchFile.launchPDF(context, "Resume",
                    pdfProvider.getPathPDF(), pdfProvider.getPDFUrl());
          }),
          SizedBox(
            height: 10,
          ),
          (UniversalPlatform.isAndroid || UniversalPlatform.isIOS)
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    primaryButton(
                        context,
                        Icons.android,
                        Colors.green,
                        Theme.of(context).primaryColor,
                        190,
                        "Available on Android!",
                        110,
                        () {}),
                    SizedBox(width: 20),
                    primaryButton(
                        context,
                        FontAwesomeIcons.apple,
                        Colors.black,
                        Theme.of(context).primaryColor,
                        190,
                        "Available on iOS!",
                        110,
                        () {}),
                  ],
                )
        ],
      ),
    ),
  );
}
