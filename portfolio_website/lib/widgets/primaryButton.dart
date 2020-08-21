import 'package:Portfolio/utilities/index.dart';

Container primaryButton(
  BuildContext context,
  IconData icon,
  Color backgroundColor,
  Color textColor,
  double containerWidth,
  String text,
  double textWidth,
  Function func,
) {
  return Container(
    width: containerWidth,
    height: 50,
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
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      onPressed: () {
        func();
      },
    ),
  );
}
