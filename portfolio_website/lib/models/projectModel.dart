import 'package:flutter/cupertino.dart';

class Projects {
  final String category;
  final String projectName;
  final List images;
  final List stack;
  final Map links;

  Projects({
    @required this.category,
    @required this.projectName,
    @required this.images,
    @required this.stack,
    @required this.links,
  });
}
