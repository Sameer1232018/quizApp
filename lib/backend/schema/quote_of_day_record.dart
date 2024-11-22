import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuoteOfDayRecord extends FirestoreRecord {
  QuoteOfDayRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  bool hasQuote() => _quote != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  void _initializeFields() {
    _quote = snapshotData['quote'] as String?;
    _author = snapshotData['author'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quoteOfDay');

  static Stream<QuoteOfDayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuoteOfDayRecord.fromSnapshot(s));

  static Future<QuoteOfDayRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuoteOfDayRecord.fromSnapshot(s));

  static QuoteOfDayRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuoteOfDayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuoteOfDayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuoteOfDayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuoteOfDayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuoteOfDayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuoteOfDayRecordData({
  String? quote,
  String? author,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quote': quote,
      'author': author,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuoteOfDayRecordDocumentEquality implements Equality<QuoteOfDayRecord> {
  const QuoteOfDayRecordDocumentEquality();

  @override
  bool equals(QuoteOfDayRecord? e1, QuoteOfDayRecord? e2) {
    return e1?.quote == e2?.quote && e1?.author == e2?.author;
  }

  @override
  int hash(QuoteOfDayRecord? e) =>
      const ListEquality().hash([e?.quote, e?.author]);

  @override
  bool isValidKey(Object? o) => o is QuoteOfDayRecord;
}
