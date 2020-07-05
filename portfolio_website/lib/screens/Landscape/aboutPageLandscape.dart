import 'package:portfolio_website/utilities/index.dart';

class AboutPageLandscape extends StatefulWidget {
  @override
  _AboutPageLandscapeState createState() => _AboutPageLandscapeState();
}

class _AboutPageLandscapeState extends State<AboutPageLandscape> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getContactCard(context, 0.35, () => setState(() {})),
            getExperience(context, 0.35)
          ],
        ),
        // SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
