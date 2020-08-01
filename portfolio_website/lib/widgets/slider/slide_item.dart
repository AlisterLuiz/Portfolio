import 'package:portfolio_website/utilities/index.dart';

class SlideItem extends StatelessWidget {
  final String image;
  SlideItem(this.image);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight(context) * 0.35,
          width: screenWidth(context),
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
