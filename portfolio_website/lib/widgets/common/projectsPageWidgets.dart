// import 'package:portfolio_website/utilities/index.dart';
// import 'package:portfolio_website/widgets/mouseHover.dart';

// Map currentProject = {
//   1: 'Mobile App Development',
//   2: 'Full Stack Development',
//   3: 'Machine Learning Projects',
//   4: 'Academic Projects',
// };

// Map onSelected = {
//   1: false,
//   2: false,
//   3: false,
//   4: false,
// };

// Widget getMapper(BuildContext context, Projects project, String map) {
//   Map linkMapper = {
//     "LinkedIn": getLink(context, project, FontAwesomeIcons.linkedinIn,
//         Color(0xff0072b1), 'LinkedIn'),
//     "GitHub": getLink(
//         context, project, FontAwesomeIcons.github, Color(0xff211F1F), 'GitHub'),
//     "Website": getLink(
//         context, project, FontAwesomeIcons.globe, Color(0xffFF0000), 'Website'),
//     "Paper": getLink(
//         context, project, FontAwesomeIcons.scroll, Color(0xff00ccbb), 'Paper'),
//     "Slides": getLink(context, project, FontAwesomeIcons.filePowerpoint,
//         Color(0xfff5b912), 'Slides'),
//   };
//   return linkMapper[map];
// }

// Widget getTechStack(BuildContext context, String stackName, int orientation) {
//   return Container(
//     height: 30,
//     child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5),
//       child: Center(
//         child: RaisedButton(
//           textColor: Color(0xff8240D8),
//           color: Theme.of(context).primaryColor,
//           elevation: 4,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AutoSizeText(
//                 stackName,
//                 style: TextStyle(
//                   fontFamily: 'Montserrat',
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Theme.of(context).scaffoldBackgroundColor,
//                 ),
//               ),
//             ],
//           ),
//           onPressed: () {},
//         ),
//       ),
//     ),
//   );
// }

// Widget getLink(BuildContext context, Projects project, IconData icon,
//     Color color, String text) {
//   return Container(
//     height: 30,
//     padding: EdgeInsets.symmetric(horizontal: 10),
//     child: RaisedButton(
//       textColor: Colors.white,
//       color: color,
//       elevation: 4,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             // color: Theme.of(context).primaryColor,
//             screenSize(context): 20,
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Text(
//             text,
//             style: TextStyle(
//               fontFamily: 'Montserrat',
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//               // color: Theme.of(context).primaryColor,
//             ),
//           ),
//         ],
//       ),
//       onPressed: () {
//         launchURL(project.links[text]);
//       },
//     ),
//   );
// }

// Widget getLinks(BuildContext context, Projects project) {
//   return Container(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         for (int i = 0; i < project.links.length; i++)
//           getMapper(context, project, project.links.keys.toList()[i])
//       ],
//     ),
//   );
// }

// Widget getProjectList(BuildContext context, Projects project, int orientation) {
  // return Container(
    // decoration: BoxDecoration(
    //   border: Border.all(
    //     width: 2,
    //     color: Theme.of(context).primaryColor,
    //   ),
    // ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         FlipCard(
//           direction: FlipDirection.HORIZONTAL,
//           front: Column(
//             children: [
              // CarouselSlider(
              //   items: getElementsLength(project.images.length).map((i) {
              //     return Image.network(
              //       project.images[i],
              //       fit: BoxFit.fill,
              //       width: screenWidth(context),
              //     );
              //   }).toList(),
              //   options: CarouselOptions(
              //     autoPlay: true,
              //     enableInfiniteScroll: false,
              //     autoPlayAnimationDuration: Duration(seconds: 2),
              //     viewportFraction: 1,
              //     height: 100,
              //   ),
              // ),
//               FittedBox(
//                 fit: BoxFit.contain,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     project.projectName,
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     textAlign: TextAlign.center,
//                     maxLines: 2,
//                   ),
//                 ),
//               ),
//             ],
//           ).showCursorOnHover,
//           back: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: AutoSizeText(
//                   'Dolore deserunt aliquip exercitation mollit aute nulla in incididunt aliquip ex ipsum.',
//                   minFontSize: 10,
//                   maxFontSize: 13,
//                 ),
//               ),
//               Column(
//                 children: [
//                   AutoSizeText(
//                     'Stack',
//                     minFontSize: 10,
//                     maxFontSize: 13,
//                   ),
//                   FittedBox(
//                     fit: BoxFit.contain,
//                     child: (project.stack != null)
//                         ? (project.stack.length > 3)
//                             ? Column(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       for (int i = 0; i < 3; i++)
//                                         FittedBox(
//                                           fit: BoxFit.fitHeight,
//                                           child: getTechStack(context,
//                                               project.stack[i], orientation),
//                                         ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     children: [
//                                       for (int i = 3;
//                                           i < project.stack.length;
//                                           i++)
//                                         FittedBox(
//                                           fit: BoxFit.fitHeight,
//                                           child: getTechStack(context,
//                                               project.stack[i], orientation),
//                                         ),
//                                     ],
//                                   ),
//                                 ],
//                               )
//                             : Row(
//                                 children: [
//                                   for (int i = 0; i < project.stack.length; i++)
//                                     getTechStack(
//                                         context, project.stack[i], orientation),
//                                 ],
//                               )
//                         : Container(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ).showCursorOnHover,
//         SizedBox(
//           height: 2,
//         ),
//         FittedBox(
//           fit: BoxFit.fitHeight,
//           child: getLinks(context, project),
//         ),
//         SizedBox(
//           height: 1,
//         ),
//       ],
//     ),
//   );
// }

// Widget displayProjects(BuildContext context, Map projects, int projectID,
//     String projectName, int orientation) {
//   CarouselController _controller = CarouselController();
//   List<Projects> currentProject = projects[currentProjectList[projectID]];
//   return (projectID == 0)
//       ? Container()
//       : Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             (orientation == 1)
//                 ? FittedBox(
//                     fit: BoxFit.fitWidth,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           projectName,
//                           style: TextStyle(fontSize: 30),
//                         ),
//                         Row(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 _controller.previousPage();
//                               },
//                               child: Icon(Icons.keyboard_arrow_left, screenSize(context): 60),
//                             ),
//                             SizedBox(width: 40),
//                             InkWell(
//                               onTap: () {
//                                 _controller.nextPage();
//                               },
//                               child: Icon(
//                                 Icons.keyboard_arrow_right,
//                                 screenSize(context): 60,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 : Container(),
//             CarouselSlider(
//               items: getElementsLength(currentProject.length).map((i) {
//                 return getProjectList(context, currentProject[i], orientation);
//               }).toList(),
//               options: CarouselOptions(
//                 enableInfiniteScroll: false,
//                 enlargeCenterPage: true,
//                 viewportFraction: (orientation == 1) ? 0.4 : 0.8,
//                 height: screenHeight(context) * 0.3,
//               ),
//               carouselController: _controller,
//             ),
//           ],
//         );
// }

// Widget getTopicCardContainer(
//     BuildContext context, IconData icon, String topic, int projectID) {
//   return Container(
//     width: screenWidth(context) * 0.2,
// height: screenHeight(context) * 0.15,
// decoration: BoxDecoration(
//   border: Border.all(
//     color: Theme.of(context).primaryColor,
//   ),
//   color: (onSelected[projectID] == true)
//       ? Theme.of(context).primaryColor
//       : null,
// ),
// child: FittedBox(
//   fit: BoxFit.fitWidth,
//   child: Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           icon,
//           screenSize(context): 20,
//           color: (onSelected[projectID] == true)
//               ? Theme.of(context).scaffoldBackgroundColor
//               : null,
//         ),
//         SizedBox(
//           width: 5,
//         ),
//         Text(
//           topic,
//           maxLines: 2,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontWeight: FontWeight.w700,
//             color: (onSelected[projectID] == true)
//                 ? Theme.of(context).scaffoldBackgroundColor
//                 : null,
//             fontSize: 20,
//           ),
//         ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget getTab(IconData icon, String text) {
//   return Tab(
//     child: FittedBox(
//       fit: BoxFit.fitWidth,
//       child: Row(
//         children: [
//           Icon(icon),
//           SizedBox(width: 5),
//           Text(text, textAlign: TextAlign.center),
//         ],
//       ),
//     ),
//   );
// }

import 'dart:math';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/parallaxCard.dart';

List categories = [
  [
    'https://www.handycats.com/wp-content/uploads/2017/09/iPhone-Application-Development-Background-HD.png',
    FontAwesomeIcons.mobileAlt,
    'Mobile Apps'
  ],
  [
    'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
    Icons.laptop_chromebook,
    'Full Stack'
  ],
  [
    'https://wallpaperaccess.com/full/1426870.png',
    Icons.graphic_eq,
    'Machine Learning'
  ],
  [
    'https://images6.alphacoders.com/480/thumb-1920-480421.jpg',
    FontAwesomeIcons.userGraduate,
    'Academic'
  ],
];

Map onSelected = {
  1: false,
  2: false,
  3: false,
  4: false,
};

Map currentProjectList = {
  1: 'Mobile',
  2: 'Full Stack',
  3: 'ML',
  4: 'Academic',
};

Widget getProjectCategories(
    BuildContext context, int orientation, Function setState) {
  final currentID = Provider.of<CurrentProjectIDProvider>(context);
  final currentProjectID = Provider.of<CurrentProjectIDProvider>(context);
  bool hover = false;
  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;
  double percentageX = (localX / (screenSize(context).width - 40)) * 100;
  double percentageY = (localY / 230) * 100;
  return LayoutBuilder(
    builder: (context, constraint) {
      return GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == 1) ? 2 : 1,
          childAspectRatio: (orientation == 1)
              ? screenWidth(context) * 1.1 / screenHeight(context) * 1.1
              : screenWidth(context) * 2 / screenHeight(context) * 2,
        ),
        itemBuilder: (context, index) {
          return (UniversalPlatform.isWeb)
              ? ParallaxCard(
                  image: categories[index][0],
                  icon: categories[index][1],
                  text: categories[index][2],
                  orientation: orientation,
                  currentID: currentProjectID,
                  index: index,
                )
              : GestureDetector(
                  onTap: () {
                    currentProjectID.setIndex(index + 1);
                  },
                  child: GFCard(
                    elevation: (hover == true) ? 5 : 1,
                    boxFit: BoxFit.cover,
                    imageOverlay: NetworkImage(categories[index][0]),
                    title: GFListTile(
                      icon: FittedBox(child: Icon(categories[index][1])),
                      title: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              categories[index][2],
                            ),
                            SizedBox(height: 2),
                            Container(
                              height: 5,
                              width: 30,
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      );
    },
  );
}
