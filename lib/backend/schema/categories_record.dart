import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cat_name" field.
  String? _catName;
  String get catName => _catName ?? '';
  bool hasCatName() => _catName != null;

  // "sets_num" field.
  int? _setsNum;
  int get setsNum => _setsNum ?? 0;
  bool hasSetsNum() => _setsNum != null;

  // "catId" field.
  String? _catId;
  String get catId => _catId ?? '';
  bool hasCatId() => _catId != null;

  // "fill_color" field.
  Color? _fillColor;
  Color? get fillColor => _fillColor;
  bool hasFillColor() => _fillColor != null;

  // "border_color" field.
  Color? _borderColor;
  Color? get borderColor => _borderColor;
  bool hasBorderColor() => _borderColor != null;

  // "cat_image" field.
  String? _catImage;
  String get catImage => _catImage ?? '';
  bool hasCatImage() => _catImage != null;

  // "cat_num" field.
  int? _catNum;
  int get catNum => _catNum ?? 0;
  bool hasCatNum() => _catNum != null;

  // "text_color" field.
  Color? _textColor;
  Color? get textColor => _textColor;
  bool hasTextColor() => _textColor != null;

  void _initializeFields() {
    _catName = snapshotData['cat_name'] as String?;
    _setsNum = castToType<int>(snapshotData['sets_num']);
    _catId = snapshotData['catId'] as String?;
    _fillColor = getSchemaColor(snapshotData['fill_color']);
    _borderColor = getSchemaColor(snapshotData['border_color']);
    _catImage = snapshotData['cat_image'] as String?;
    _catNum = castToType<int>(snapshotData['cat_num']);
    _textColor = getSchemaColor(snapshotData['text_color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? catName,
  int? setsNum,
  String? catId,
  Color? fillColor,
  Color? borderColor,
  String? catImage,
  int? catNum,
  Color? textColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cat_name': catName,
      'sets_num': setsNum,
      'catId': catId,
      'fill_color': fillColor,
      'border_color': borderColor,
      'cat_image': catImage,
      'cat_num': catNum,
      'text_color': textColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.catName == e2?.catName &&
        e1?.setsNum == e2?.setsNum &&
        e1?.catId == e2?.catId &&
        e1?.fillColor == e2?.fillColor &&
        e1?.borderColor == e2?.borderColor &&
        e1?.catImage == e2?.catImage &&
        e1?.catNum == e2?.catNum &&
        e1?.textColor == e2?.textColor;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality().hash([
        e?.catName,
        e?.setsNum,
        e?.catId,
        e?.fillColor,
        e?.borderColor,
        e?.catImage,
        e?.catNum,
        e?.textColor
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
