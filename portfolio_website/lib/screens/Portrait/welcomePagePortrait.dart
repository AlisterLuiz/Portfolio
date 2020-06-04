import 'package:portfolio_website/utilities/index.dart';

class WelcomePagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: getProfilePicture(null, null),
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
              getInfoLinks(context, 2),
            ],
          ),
          SizedBox(height: 20),
          getButtons(context, 2)
        ],
      ),
    );
  }
}
