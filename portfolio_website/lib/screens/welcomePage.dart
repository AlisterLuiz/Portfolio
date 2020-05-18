import 'package:portfolio_website/utilities/index.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
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
        Column(
          children: [
            Text(
              'Flutter Developer and \nAspiring Data Scientist based in\nDubai',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              child: RaisedButton(
                textColor: Color(0xff8240D8),
                color: Theme.of(context).primaryColor,
                elevation: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.fileDownload,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Get my Resume!".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
