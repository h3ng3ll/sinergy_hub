import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/services/firebase/firebase_firestore_service.dart';

class PaginationHelper {
  static Query apply(
    Query query,
    DocumentSnapshot? lastDoc,
    FirebaseFirestoreService service,
  ) {
    if (lastDoc == null) return query;

    return service.applyPagination(
      query,
      lastDoc,
    );
  }
}
