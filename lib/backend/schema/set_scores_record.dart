import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SetScoresRecord extends FirestoreRecord {
  SetScoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "set_score" field.
  int? _setScore;
  int get setScore => _setScore ?? 0;
  bool hasSetScore() => _setScore != null;

  // "setId" field.
  String? _setId;
  String get setId => _setId ?? '';
  bool hasSetId() => _setId != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  void _initializeFields() {
    _setScore = castToType<int>(snapshotData['set_score']);
    _setId = snapshotData['setId'] as String?;
    _user = snapshotData['user'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('set_scores');

  static Stream<SetScoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SetScoresRecord.fromSnapshot(s));

  static Future<SetScoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SetScoresRecord.fromSnapshot(s));

  static SetScoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SetScoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SetScoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SetScoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SetScoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SetScoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSetScoresRecordData({
  int? setScore,
  String? setId,
  String? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'set_score': setScore,
      'setId': setId,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class SetScoresRecordDocumentEquality implements Equality<SetScoresRecord> {
  const SetScoresRecordDocumentEquality();

  @override
  bool equals(SetScoresRecord? e1, SetScoresRecord? e2) {
    return e1?.setScore == e2?.setScore &&
        e1?.setId == e2?.setId &&
        e1?.user == e2?.user;
  }

  @override
  int hash(SetScoresRecord? e) =>
      const ListEquality().hash([e?.setScore, e?.setId, e?.user]);

  @override
  bool isValidKey(Object? o) => o is SetScoresRecord;
}
