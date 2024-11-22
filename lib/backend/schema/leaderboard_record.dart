import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaderboardRecord extends FirestoreRecord {
  LeaderboardRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "quizScore" field.
  int? _quizScore;
  int get quizScore => _quizScore ?? 0;
  bool hasQuizScore() => _quizScore != null;

  // "totalScore" field.
  int? _totalScore;
  int get totalScore => _totalScore ?? 0;
  bool hasTotalScore() => _totalScore != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "dp" field.
  String? _dp;
  String get dp => _dp ?? '';
  bool hasDp() => _dp != null;

  // "coins" field.
  int? _coins;
  int get coins => _coins ?? 0;
  bool hasCoins() => _coins != null;

  void _initializeFields() {
    _quizScore = castToType<int>(snapshotData['quizScore']);
    _totalScore = castToType<int>(snapshotData['totalScore']);
    _user = snapshotData['user'] as String?;
    _name = snapshotData['Name'] as String?;
    _dp = snapshotData['dp'] as String?;
    _coins = castToType<int>(snapshotData['coins']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leaderboard');

  static Stream<LeaderboardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeaderboardRecord.fromSnapshot(s));

  static Future<LeaderboardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeaderboardRecord.fromSnapshot(s));

  static LeaderboardRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeaderboardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeaderboardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeaderboardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeaderboardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeaderboardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeaderboardRecordData({
  int? quizScore,
  int? totalScore,
  String? user,
  String? name,
  String? dp,
  int? coins,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizScore': quizScore,
      'totalScore': totalScore,
      'user': user,
      'Name': name,
      'dp': dp,
      'coins': coins,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeaderboardRecordDocumentEquality implements Equality<LeaderboardRecord> {
  const LeaderboardRecordDocumentEquality();

  @override
  bool equals(LeaderboardRecord? e1, LeaderboardRecord? e2) {
    return e1?.quizScore == e2?.quizScore &&
        e1?.totalScore == e2?.totalScore &&
        e1?.user == e2?.user &&
        e1?.name == e2?.name &&
        e1?.dp == e2?.dp &&
        e1?.coins == e2?.coins;
  }

  @override
  int hash(LeaderboardRecord? e) => const ListEquality()
      .hash([e?.quizScore, e?.totalScore, e?.user, e?.name, e?.dp, e?.coins]);

  @override
  bool isValidKey(Object? o) => o is LeaderboardRecord;
}
