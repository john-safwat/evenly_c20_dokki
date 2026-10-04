import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c20_dokki/models/event.dart';

class FirebaseDatabase {
  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference<Event> getCollectionReference() {
    return FirebaseFirestore.instance
        .collection("events")
        .withConverter<Event>(
          fromFirestore: Event.fromFirestore,
          toFirestore: (Event event, _) => event.toFirestore(),
        );
  }

  Future<void> addEvent(Event event) async {
    var ref = getCollectionReference();
    var doc = ref.doc();
    event.id = doc.id;
    await doc.set(event);
  }

  Future<List<Event>> getEventsList() async {
    var ref = getCollectionReference();
    var snapshot = await ref.get();
    var events = snapshot.docs.map((e) => e.data()).toList();
    events.sort((a, b) => b.date!.compareTo(a.date!));
    return events;
  }

  Stream<QuerySnapshot<Event>> getEventsStream({
    String? category,
    String? uid,
    String? query,
  }) {
    var ref = getCollectionReference();
    return ref
        .where("category", isEqualTo: category)
        .where("likes", arrayContains: uid)
        .snapshots();
  }

  Future<void> updateEvent(Event event) async {
    var ref = getCollectionReference();
    await ref.doc(event.id).update(event.toFirestore());
  }
}
