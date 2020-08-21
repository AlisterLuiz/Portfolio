import 'dart:ui';

import 'package:Portfolio/utilities/index.dart';

class SlideItem extends StatelessWidget {
  final String image;
  SlideItem(this.image);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight(context) * 0.4,
          width: screenWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                alignment: Alignment.center,
                child: Image.network(
                  image,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
