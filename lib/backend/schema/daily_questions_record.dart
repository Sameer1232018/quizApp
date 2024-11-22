import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyQuestionsRecord extends FirestoreRecord {
  DailyQuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  // "incorrect" field.
  List<String>? _incorrect;
  List<String> get incorrect => _incorrect ?? const [];
  bool hasIncorrect() => _incorrect != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
    _incorrect = getDataList(snapshotData['incorrect']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dailyQuestions');

  static Stream<DailyQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyQuestionsRecord.fromSnapshot(s));

  static Future<DailyQuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyQuestionsRecord.fromSnapshot(s));

  static DailyQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyQuestionsRecordData({
  String? question,
  String? answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'answer': answer,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyQuestionsRecordDocumentEquality
    implements Equality<DailyQuestionsRecord> {
  const DailyQuestionsRecordDocumentEquality();

  @override
  bool equals(DailyQuestionsRecord? e1, DailyQuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.answer == e2?.answer &&
        listEquality.equals(e1?.incorrect, e2?.incorrect);
  }

  @override
  int hash(DailyQuestionsRecord? e) =>
      const ListEquality().hash([e?.question, e?.answer, e?.incorrect]);

  @override
  bool isValidKey(Object? o) => o is DailyQuestionsRecord;
}
