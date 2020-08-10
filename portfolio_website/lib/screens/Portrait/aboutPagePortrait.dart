import 'package:portfolio_website/utilities/index.dart';

class AboutPagePortrait extends StatefulWidget {
  @override
  _AboutPagePortraitState createState() => _AboutPagePortraitState();
}

class _AboutPagePortraitState extends State<AboutPagePortrait> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight(context) * 0.43,
              child: getContactCard(
                context,
                0.8,
                () => setState(() {}),
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Container(
              height: screenHeight(context) * 0.4,
              child: getExperience(context, 0.7),
            ),
          ],
        ),
      ],
    );
  }
}
