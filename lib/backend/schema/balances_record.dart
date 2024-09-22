import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BalancesRecord extends FirestoreRecord {
  BalancesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "account_balance" field.
  double? _accountBalance;
  double get accountBalance => _accountBalance ?? 0.0;
  bool hasAccountBalance() => _accountBalance != null;

  // "card_balance" field.
  double? _cardBalance;
  double get cardBalance => _cardBalance ?? 0.0;
  bool hasCardBalance() => _cardBalance != null;

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "outstanding_balance" field.
  double? _outstandingBalance;
  double get outstandingBalance => _outstandingBalance ?? 0.0;
  bool hasOutstandingBalance() => _outstandingBalance != null;

  // "card_bill" field.
  double? _cardBill;
  double get cardBill => _cardBill ?? 0.0;
  bool hasCardBill() => _cardBill != null;

  void _initializeFields() {
    _accountBalance = castToType<double>(snapshotData['account_balance']);
    _cardBalance = castToType<double>(snapshotData['card_balance']);
    _client = snapshotData['client'] as DocumentReference?;
    _outstandingBalance =
        castToType<double>(snapshotData['outstanding_balance']);
    _cardBill = castToType<double>(snapshotData['card_bill']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('balances');

  static Stream<BalancesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BalancesRecord.fromSnapshot(s));

  static Future<BalancesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BalancesRecord.fromSnapshot(s));

  static BalancesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BalancesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BalancesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BalancesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BalancesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BalancesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBalancesRecordData({
  double? accountBalance,
  double? cardBalance,
  DocumentReference? client,
  double? outstandingBalance,
  double? cardBill,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'account_balance': accountBalance,
      'card_balance': cardBalance,
      'client': client,
      'outstanding_balance': outstandingBalance,
      'card_bill': cardBill,
    }.withoutNulls,
  );

  return firestoreData;
}

class BalancesRecordDocumentEquality implements Equality<BalancesRecord> {
  const BalancesRecordDocumentEquality();

  @override
  bool equals(BalancesRecord? e1, BalancesRecord? e2) {
    return e1?.accountBalance == e2?.accountBalance &&
        e1?.cardBalance == e2?.cardBalance &&
        e1?.client == e2?.client &&
        e1?.outstandingBalance == e2?.outstandingBalance &&
        e1?.cardBill == e2?.cardBill;
  }

  @override
  int hash(BalancesRecord? e) => const ListEquality().hash([
        e?.accountBalance,
        e?.cardBalance,
        e?.client,
        e?.outstandingBalance,
        e?.cardBill
      ]);

  @override
  bool isValidKey(Object? o) => o is BalancesRecord;
}
