import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransfersRecord extends FirestoreRecord {
  TransfersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipe" field.
  int? _tipe;
  int get tipe => _tipe ?? 0;
  bool hasTipe() => _tipe != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  bool hasOrigin() => _origin != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "datasearch" field.
  String? _datasearch;
  String get datasearch => _datasearch ?? '';
  bool hasDatasearch() => _datasearch != null;

  void _initializeFields() {
    _tipe = castToType<int>(snapshotData['tipe']);
    _name = snapshotData['name'] as String?;
    _value = castToType<double>(snapshotData['value']);
    _origin = snapshotData['origin'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _client = snapshotData['client'] as DocumentReference?;
    _datasearch = snapshotData['datasearch'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transfers');

  static Stream<TransfersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransfersRecord.fromSnapshot(s));

  static Future<TransfersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransfersRecord.fromSnapshot(s));

  static TransfersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransfersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransfersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransfersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransfersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransfersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransfersRecordData({
  int? tipe,
  String? name,
  double? value,
  String? origin,
  DateTime? date,
  DocumentReference? client,
  String? datasearch,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipe': tipe,
      'name': name,
      'value': value,
      'origin': origin,
      'date': date,
      'client': client,
      'datasearch': datasearch,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransfersRecordDocumentEquality implements Equality<TransfersRecord> {
  const TransfersRecordDocumentEquality();

  @override
  bool equals(TransfersRecord? e1, TransfersRecord? e2) {
    return e1?.tipe == e2?.tipe &&
        e1?.name == e2?.name &&
        e1?.value == e2?.value &&
        e1?.origin == e2?.origin &&
        e1?.date == e2?.date &&
        e1?.client == e2?.client &&
        e1?.datasearch == e2?.datasearch;
  }

  @override
  int hash(TransfersRecord? e) => const ListEquality().hash([
        e?.tipe,
        e?.name,
        e?.value,
        e?.origin,
        e?.date,
        e?.client,
        e?.datasearch
      ]);

  @override
  bool isValidKey(Object? o) => o is TransfersRecord;
}
