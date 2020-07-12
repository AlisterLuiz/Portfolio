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
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getContactCard(context, 0.8, () => setState(() {})),
              SizedBox(
                height: 30,
              ),
              getExperience(context, 0.7),
            ],
          ),
        ),
      ],
    );
  }
}
