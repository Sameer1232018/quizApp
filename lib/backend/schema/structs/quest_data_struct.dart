// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestDataStruct extends FFFirebaseStruct {
  QuestDataStruct({
    String? question,
    List<String>? options,
    String? correctAnswer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _options = options,
        _correctAnswer = correctAnswer,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? 'NA';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "correct_answer" field.
  String? _correctAnswer;
  String get correctAnswer => _correctAnswer ?? 'NA';
  set correctAnswer(String? val) => _correctAnswer = val;

  bool hasCorrectAnswer() => _correctAnswer != null;

  static QuestDataStruct fromMap(Map<String, dynamic> data) => QuestDataStruct(
        question: data['question'] as String?,
        options: getDataList(data['options']),
        correctAnswer: data['correct_answer'] as String?,
      );

  static QuestDataStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'options': _options,
        'correct_answer': _correctAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'correct_answer': serializeParam(
          _correctAnswer,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestDataStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        correctAnswer: deserializeParam(
          data['correct_answer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestDataStruct &&
        question == other.question &&
        listEquality.equals(options, other.options) &&
        correctAnswer == other.correctAnswer;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([question, options, correctAnswer]);
}

QuestDataStruct createQuestDataStruct({
  String? question,
  String? correctAnswer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestDataStruct(
      question: question,
      correctAnswer: correctAnswer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestDataStruct? updateQuestDataStruct(
  QuestDataStruct? questData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    questData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestDataStructData(
  Map<String, dynamic> firestoreData,
  QuestDataStruct? questData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (questData == null) {
    return;
  }
  if (questData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && questData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questDataData = getQuestDataFirestoreData(questData, forFieldValue);
  final nestedData = questDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = questData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestDataFirestoreData(
  QuestDataStruct? questData, [
  bool forFieldValue = false,
]) {
  if (questData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(questData.toMap());

  // Add any Firestore field values
  questData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestDataListFirestoreData(
  List<QuestDataStruct>? questDatas,
) =>
    questDatas?.map((e) => getQuestDataFirestoreData(e, true)).toList() ?? [];
