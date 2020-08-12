import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/utilities/pdf_viewer/launchPDF.dart';
import 'package:portfolio_website/widgets/animations/welcomeScreenAnimations.dart';

Image getProfilePicture(double height, double width) {
  return Image.asset('assets/images/profile.png', height: height, width: width);
}

Widget getName() {
  return TypewriterAnimatedTextKit(
      text: [
        "Alister\nLuiz",
      ],
      textStyle: TextStyle(
        fontSize: 100.0,
        fontWeight: FontWeight.w600,
      ),
      totalRepeatCount: 1,
      speed: Duration(
        milliseconds: 600,
      ),
      textAlign: TextAlign.start,
      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
      );
}

Column getInfoLinks(
    BuildContext context, int pos, WelcomeScreenAnimation controller) {
  return Column(
    crossAxisAlignment:
        (pos == 1) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Container(
        height: 10,
        width: controller.containerWidth.value,
        color: Theme.of(context).accentColor,
      ),
      SizedBox(height: 20),
      Container(
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: controller.icon1Opacity.value,
              child: InkWell(
                onTap: () {
                  launchURL('https://github.com/AlisterLuiz');
                },
                child: Icon(FontAwesomeIcons.github),
              ),
            ),
            Opacity(
              opacity: controller.icon2Opacity.value,
              child: InkWell(
                  onTap: () {
                    launchURL('https://www.linkedin.com/in/alisterluiz/');
                  },
                  child: Icon(FontAwesomeIcons.linkedinIn)),
            ),
            Opacity(
              opacity: controller.icon3Opacity.value,
              child: InkWell(
                  onTap: () {
                    launchURL('https://www.instagram.com/alister_luiz/');
                  },
                  child: Icon(FontAwesomeIcons.instagram)),
            ),
          ],
        ),
      ),
    ],
  );
}

Container getButtons(
    BuildContext context, int width, WelcomeScreenAnimation controller) {
  return Container(
    width: (width == 1) ? screenWidth(context) * 0.30 : null,
    child: FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: controller.descOpacity.value,
            child: Text(
              'Flutter Developer and \nAspiring Data Scientist based in\nDubai',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Opacity(
            opacity: controller.button1Opacity.value,
            child: primaryButton(
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
          ),
          SizedBox(
            height: 10,
          ),
          (UniversalPlatform.isAndroid || UniversalPlatform.isIOS)
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: controller.button2Opacity.value,
                      child: primaryButton(
                          context,
                          Icons.android,
                          Colors.green,
                          Theme.of(context).primaryColor,
                          190,
                          "Available on Android!",
                          110,
                          () {}),
                    ),
                    SizedBox(width: 20),
                    Opacity(
                      opacity: controller.button3Opacity.value,
                      child: primaryButton(
                          context,
                          FontAwesomeIcons.apple,
                          Colors.black,
                          Theme.of(context).primaryColor,
                          190,
                          "Available on iOS!",
                          110,
                          () {}),
                    ),
                  ],
                )
        ],
      ),
    ),
  );
}
