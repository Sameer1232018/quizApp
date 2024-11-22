import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizQuestionsRecord extends FirestoreRecord {
  QuizQuestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "setId" field.
  String? _setId;
  String get setId => _setId ?? '';
  bool hasSetId() => _setId != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "correctAnswer" field.
  String? _correctAnswer;
  String get correctAnswer => _correctAnswer ?? '';
  bool hasCorrectAnswer() => _correctAnswer != null;

  // "questNum" field.
  int? _questNum;
  int get questNum => _questNum ?? 0;
  bool hasQuestNum() => _questNum != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  void _initializeFields() {
    _setId = snapshotData['setId'] as String?;
    _question = snapshotData['question'] as String?;
    _correctAnswer = snapshotData['correctAnswer'] as String?;
    _questNum = castToType<int>(snapshotData['questNum']);
    _options = getDataList(snapshotData['options']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz_questions');

  static Stream<QuizQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizQuestionsRecord.fromSnapshot(s));

  static Future<QuizQuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizQuestionsRecord.fromSnapshot(s));

  static QuizQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizQuestionsRecordData({
  String? setId,
  String? question,
  String? correctAnswer,
  int? questNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'setId': setId,
      'question': question,
      'correctAnswer': correctAnswer,
      'questNum': questNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizQuestionsRecordDocumentEquality
    implements Equality<QuizQuestionsRecord> {
  const QuizQuestionsRecordDocumentEquality();

  @override
  bool equals(QuizQuestionsRecord? e1, QuizQuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.setId == e2?.setId &&
        e1?.question == e2?.question &&
        e1?.correctAnswer == e2?.correctAnswer &&
        e1?.questNum == e2?.questNum &&
        listEquality.equals(e1?.options, e2?.options);
  }

  @override
  int hash(QuizQuestionsRecord? e) => const ListEquality()
      .hash([e?.setId, e?.question, e?.correctAnswer, e?.questNum, e?.options]);

  @override
  bool isValidKey(Object? o) => o is QuizQuestionsRecord;
}
