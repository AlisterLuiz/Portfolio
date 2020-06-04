import 'package:portfolio_website/utilities/index.dart';

class AboutPageLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getContactCard(context, 0.35),
            getExperience(context, 0.35)
          ],
        ),
      ],
    );
  }
}
