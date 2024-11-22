import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactUsRecord extends FirestoreRecord {
  ContactUsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _email = snapshotData['Email'] as String?;
    _subject = snapshotData['Subject'] as String?;
    _message = snapshotData['Message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contact_us');

  static Stream<ContactUsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactUsRecord.fromSnapshot(s));

  static Future<ContactUsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactUsRecord.fromSnapshot(s));

  static ContactUsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactUsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactUsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactUsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactUsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactUsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactUsRecordData({
  String? name,
  String? email,
  String? subject,
  String? message,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Email': email,
      'Subject': subject,
      'Message': message,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactUsRecordDocumentEquality implements Equality<ContactUsRecord> {
  const ContactUsRecordDocumentEquality();

  @override
  bool equals(ContactUsRecord? e1, ContactUsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.subject == e2?.subject &&
        e1?.message == e2?.message;
  }

  @override
  int hash(ContactUsRecord? e) =>
      const ListEquality().hash([e?.name, e?.email, e?.subject, e?.message]);

  @override
  bool isValidKey(Object? o) => o is ContactUsRecord;
}
