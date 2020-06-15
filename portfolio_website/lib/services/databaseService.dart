import 'package:portfolio_website/utilities/index.dart';

final Firestore _db = Firestore.instance;

Stream<List<Projects>> getProjects() {
  var ref = _db.collection('Projects');
  return ref.snapshots().map(getProjectsStream);
}

List<Projects> getProjectsStream(QuerySnapshot doc) {
  List<Projects> notif = [];
  doc.documents.forEach((element) {
    notif.add(
      Projects(
        category: element.data['Category'].toString(),
        projectName: element.data['ProjectName'].toString(),
        images: element.data['Images'],
        links: element.data['Links'],
        stack: element.data['Stack'] ?? [],
      ),
    );
  });
  return notif;
}
