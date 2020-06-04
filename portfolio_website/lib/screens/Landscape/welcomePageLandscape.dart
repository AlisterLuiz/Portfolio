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
                      child: getProfilePicture(400, 400),
                    ),
                    getName(),
                  ],
                ),
                getInfoLinks(context, 1),
              ],
            ),
          ),
        ),
        getButtons(context, 1)
      ],
    );
  }
}
