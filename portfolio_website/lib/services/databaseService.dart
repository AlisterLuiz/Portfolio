import 'package:portfolio_website/utilities/index.dart';

final Firestore _db = Firestore.instance;
var refProjects = _db.collection('Projects');
var refTestimonials = _db.collection('Testimonials');

Future<Map<String, List<Projects>>> getProjects() async {
  var querySnap = await refProjects.getDocuments();
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

Future<List<Testimonials>> getTestimonials() async {
  var querySnap = await refTestimonials.getDocuments();
  List<Testimonials> testimonialsList = [];

  List data = querySnap.documents.map((snap) => snap.data).toList();
  for (int i = 0; i < data.length; i++) {
    testimonialsList.add(
      Testimonials(
        name: data[i]['Name'],
        photo: data[i]['Photo'],
        content: data[i]['Content'],
        position: data[i]['Position'],
      ),
    );
  }
  return testimonialsList;
}
