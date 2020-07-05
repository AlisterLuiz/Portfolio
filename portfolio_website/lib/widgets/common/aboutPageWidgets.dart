import 'package:portfolio_website/utilities/index.dart';

String email = '';
String name = '';
String message = '';
final _emailKey = GlobalKey<FormState>();
final _nameKey = GlobalKey<FormState>();
Container getExperience(BuildContext context, double width) {
  return Container(
    width: screenWidth(context) * width,
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '“The only limit to our realization\nof tomorrow will be our doubts of\ntoday”',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              Text('- Franklin D. Roosevelt'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            child: Row(
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
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Website and Mobile Application proudly built using\nFlutter 💙 and Firebase 🔥',
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

Container getContactCard(
    BuildContext context, double width, Function setState) {
  return Container(
    width: screenWidth(context) * width,
    height: screenHeight(context) * 0.7,
    child: FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Contact Card',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                  null, () {
                launchURL('mailto:alisterluiz@gmail.com');
              }),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Have a project or an enquiry? \nFeel free to send me a message',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  onChanged: (value) {
                    email = value;
                    print(email);
                    setState();
                  },
                  key: _emailKey,
                  validator: (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value))
                      return 'Enter a Valid Email';
                    else
                      return null;
                  },
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
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  onChanged: (value) {
                    name = value;
                    print(name);
                    setState();
                  },
                  key: _nameKey,
                  validator: (value) {
                    if (value.length < 3 ||
                        value.contains(new RegExp(r'[0-9]')))
                      return 'Enter a Valid Name!';
                    else
                      return null;
                  },
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
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
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
                  maxLines: null,
                  onChanged: (value) {
                    message = value;
                    print(message);
                    setState();
                  },
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
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
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
                  null, () {
                launchURL(
                    'mailto:alisterluiz@gmail.com?subject=Message from $email($name)&body=$message');
              }),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
