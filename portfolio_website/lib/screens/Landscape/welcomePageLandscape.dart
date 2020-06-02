import 'package:portfolio_website/utilities/index.dart';

class WelcomePageLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                      left: 230,
                      child: Image.asset('assets/images/profile.png',
                          height: 400, width: 400),
                    ),
                    Column(
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
                    ),
                  ],
                ),
                Container(
                  height: 10,
                  width: 60,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(height: 50),
                Container(
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FontAwesomeIcons.github),
                      Icon(FontAwesomeIcons.linkedinIn),
                      Icon(FontAwesomeIcons.instagram),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: screenWidth(context) * 0.32,
          child: FittedBox(
            fit: BoxFit.fitWidth,
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
                    null,
                    'Resume'),
                Row(
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
                        'Android'),
                    SizedBox(width: 20),
                    primaryButton(
                        context,
                        FontAwesomeIcons.apple,
                        Colors.black,
                        Theme.of(context).primaryColor,
                        190,
                        "Available on iOS!",
                        110,
                        'iOS'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
