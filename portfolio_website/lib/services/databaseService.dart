import 'package:portfolio_website/utilities/index.dart';

final Firestore _db = Firestore.instance;
var ref = _db.collection('Projects');

Future<Map<String, List<Projects>>> getProjects() async {
  var querySnap = await ref.getDocuments();
  Map<String, List<Projects>> projectMap = {};

  List data = querySnap.documents.map((snap) => snap.data).toList();
  for (int i = 0; i < data.length; i++) {
    if (projectMap[data[i]['Category']] == null)
      projectMap[data[i]['Category']] = [];
    projectMap[data[i]['Category']].add(
      Projects(
          category: data[i]['Category'],
          projectName: data[i]['ProjectName'],
          images: data[i]['Images'],
          stack: data[i]['Stack'],
          links: data[i]['Links']),
    );
  }
  return projectMap;
}
