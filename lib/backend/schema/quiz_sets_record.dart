import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizSetsRecord extends FirestoreRecord {
  QuizSetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "catId" field.
  String? _catId;
  String get catId => _catId ?? '';
  bool hasCatId() => _catId != null;

  // "setId" field.
  String? _setId;
  String get setId => _setId ?? '';
  bool hasSetId() => _setId != null;

  // "set_percent" field.
  int? _setPercent;
  int get setPercent => _setPercent ?? 0;
  bool hasSetPercent() => _setPercent != null;

  // "set_num" field.
  int? _setNum;
  int get setNum => _setNum ?? 0;
  bool hasSetNum() => _setNum != null;

  // "set_questions" field.
  int? _setQuestions;
  int get setQuestions => _setQuestions ?? 0;
  bool hasSetQuestions() => _setQuestions != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  void _initializeFields() {
    _catId = snapshotData['catId'] as String?;
    _setId = snapshotData['setId'] as String?;
    _setPercent = castToType<int>(snapshotData['set_percent']);
    _setNum = castToType<int>(snapshotData['set_num']);
    _setQuestions = castToType<int>(snapshotData['set_questions']);
    _cost = castToType<int>(snapshotData['cost']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz_sets');

  static Stream<QuizSetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizSetsRecord.fromSnapshot(s));

  static Future<QuizSetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizSetsRecord.fromSnapshot(s));

  static QuizSetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizSetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizSetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizSetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizSetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizSetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizSetsRecordData({
  String? catId,
  String? setId,
  int? setPercent,
  int? setNum,
  int? setQuestions,
  int? cost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'catId': catId,
      'setId': setId,
      'set_percent': setPercent,
      'set_num': setNum,
      'set_questions': setQuestions,
      'cost': cost,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizSetsRecordDocumentEquality implements Equality<QuizSetsRecord> {
  const QuizSetsRecordDocumentEquality();

  @override
  bool equals(QuizSetsRecord? e1, QuizSetsRecord? e2) {
    return e1?.catId == e2?.catId &&
        e1?.setId == e2?.setId &&
        e1?.setPercent == e2?.setPercent &&
        e1?.setNum == e2?.setNum &&
        e1?.setQuestions == e2?.setQuestions &&
        e1?.cost == e2?.cost;
  }

  @override
  int hash(QuizSetsRecord? e) => const ListEquality().hash(
      [e?.catId, e?.setId, e?.setPercent, e?.setNum, e?.setQuestions, e?.cost]);

  @override
  bool isValidKey(Object? o) => o is QuizSetsRecord;
}
