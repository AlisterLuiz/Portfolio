import 'package:portfolio_website/utilities/index.dart';

Container primaryButton(
    BuildContext context,
    IconData icon,
    Color backgroundColor,
    Color textColor,
    double containerWidth,
    String text,
    double textWidth,
    String buttonFunc) {
  return Container(
    width: containerWidth,
    child: RaisedButton(
      textColor: textColor,
      color: backgroundColor,
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: textWidth,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      onPressed: () {},
    ),
  );
}
