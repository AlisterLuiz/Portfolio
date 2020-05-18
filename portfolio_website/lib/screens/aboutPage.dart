import 'package:portfolio_website/utilities/index.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final TextEditingController _controller = new TextEditingController();
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth(context) * 0.4,
              height: screenHeight(context) * 0.66,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Contact Card',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            Icons.mail,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "alisterluiz@gmail.com",
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
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Have a project or an enquiry? \nFeel free to send me a message',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextField(
                      // controller: _controller,
                      onChanged: (value) {},
                      textAlign: TextAlign.left,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                      decoration: konboardingtextdecoration.copyWith(
                        labelText: "Email Address",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        // border: Border.all(color:)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    child: TextField(
                      // controller: _controller,
                      onChanged: (value) {},
                      textAlign: TextAlign.left,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                      decoration: konboardingtextdecoration.copyWith(
                        labelText: "Name",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        // border: Border.all(color:)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 400,
                    height: 80,
                    child: TextField(
                      // controller: _controller,
                      maxLines: null,
                      onChanged: (value) {},
                      textAlign: TextAlign.left,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                      decoration: konboardingtextdecoration.copyWith(
                        labelText: "Message",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        // border: Border.all(color:)
                      ),
                    ),
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
                            Icons.send,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Send",
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '“The only limit to our realization\nof tomorrow will be our doubts of\ntoday”',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    Text('- Franklin D. Roosevelt'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '2',
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).accentColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('\nYears of\nExperience'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '10',
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).accentColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('\nProjects\nCompleted'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
