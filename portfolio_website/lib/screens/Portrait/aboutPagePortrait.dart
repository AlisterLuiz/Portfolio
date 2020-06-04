import 'package:portfolio_website/utilities/index.dart';

class AboutPagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getContactCard(context, 0.7),
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
