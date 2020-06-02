import 'package:portfolio_website/utilities/index.dart';

class AboutPagePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final TextEditingController _controller = new TextEditingController();
    return ListView(
      children: [
        Container(
          // height: screenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth(context) * 0.7,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Contact Card',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          primaryButton(
                              context,
                              Icons.mail,
                              Theme.of(context).primaryColor,
                              Theme.of(context).scaffoldBackgroundColor,
                              300,
                              "alisterluiz@gmail.com",
                              null,
                              'Email'),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Have a project or an enquiry? \nFeel free to send me a message',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
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
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                // border: Border.all(color:)
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
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
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                // border: Border.all(color:)
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
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
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 1.0),
                                ),
                                // border: Border.all(color:)
                              ),
                            ),
                          ),
                          primaryButton(
                              context,
                              Icons.send,
                              Theme.of(context).primaryColor,
                              Theme.of(context).scaffoldBackgroundColor,
                              300,
                              "Send",
                              null,
                              'Send'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth(context) * 0.7,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '“The only limit to our realization\nof tomorrow will be our doubts of\ntoday”',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          ),
                          Text('- Franklin D. Roosevelt'),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '3',
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
                      SizedBox(
                        height: 10,
                      ),
                      AutoSizeText(
                        'Website and Mobile Application proudly built using\nFlutter 💙 and Firebase 🔥',
                        textAlign: TextAlign.center,
                        minFontSize: 16,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
