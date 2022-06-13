import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'prayer_times_record.g.dart';

abstract class PrayerTimesRecord
    implements Built<PrayerTimesRecord, PrayerTimesRecordBuilder> {
  static Serializer<PrayerTimesRecord> get serializer =>
      _$prayerTimesRecordSerializer;

  @nullable
  DateTime get lastupdate;

  @nullable
  String get todate;

  @nullable
  @BuiltValueField(wireName: 'galas_i')
  String get galasI;

  @nullable
  @BuiltValueField(wireName: 'fajer_i')
  String get fajerI;

  @nullable
  @BuiltValueField(wireName: 'sunset_i')
  String get sunsetI;

  @nullable
  @BuiltValueField(wireName: 'sunout_i')
  String get sunoutI;

  @nullable
  @BuiltValueField(wireName: 'dohor_i')
  String get dohorI;

  @nullable
  @BuiltValueField(wireName: 'aser_i')
  String get aserI;

  @nullable
  @BuiltValueField(wireName: 'magreb_i')
  String get magrebI;

  @nullable
  @BuiltValueField(wireName: 'isha_i')
  String get ishaI;

  @nullable
  @BuiltValueField(wireName: 'midnight_i')
  String get midnightI;

  @nullable
  @BuiltValueField(wireName: 'thuluth_i')
  String get thuluthI;

  @nullable
  @BuiltValueField(wireName: 'duha_i')
  String get duhaI;

  @nullable
  @BuiltValueField(wireName: 'galas_s')
  DateTime get galasS;

  @nullable
  @BuiltValueField(wireName: 'fajer_s')
  DateTime get fajerS;

  @nullable
  @BuiltValueField(wireName: 'sunset_s')
  DateTime get sunsetS;

  @nullable
  @BuiltValueField(wireName: 'sunout_s')
  DateTime get sunoutS;

  @nullable
  @BuiltValueField(wireName: 'duha_e')
  DateTime get duhaE;

  @nullable
  @BuiltValueField(wireName: 'dohor_s')
  DateTime get dohorS;

  @nullable
  @BuiltValueField(wireName: 'aser_s')
  DateTime get aserS;

  @nullable
  @BuiltValueField(wireName: 'magreb_s')
  DateTime get magrebS;

  @nullable
  @BuiltValueField(wireName: 'isha_s')
  DateTime get ishaS;

  @nullable
  @BuiltValueField(wireName: 'midnight_s')
  DateTime get midnightS;

  @nullable
  @BuiltValueField(wireName: 'thuluth_s')
  DateTime get thuluthS;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PrayerTimesRecordBuilder builder) => builder
    ..todate = ''
    ..galasI = ''
    ..fajerI = ''
    ..sunsetI = ''
    ..sunoutI = ''
    ..dohorI = ''
    ..aserI = ''
    ..magrebI = ''
    ..ishaI = ''
    ..midnightI = ''
    ..thuluthI = ''
    ..duhaI = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prayer_times');

  static Stream<PrayerTimesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PrayerTimesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PrayerTimesRecord._();
  factory PrayerTimesRecord([void Function(PrayerTimesRecordBuilder) updates]) =
      _$PrayerTimesRecord;

  static PrayerTimesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPrayerTimesRecordData({
  DateTime lastupdate,
  String todate,
  String galasI,
  String fajerI,
  String sunsetI,
  String sunoutI,
  String dohorI,
  String aserI,
  String magrebI,
  String ishaI,
  String midnightI,
  String thuluthI,
  String duhaI,
  DateTime galasS,
  DateTime fajerS,
  DateTime sunsetS,
  DateTime sunoutS,
  DateTime duhaE,
  DateTime dohorS,
  DateTime aserS,
  DateTime magrebS,
  DateTime ishaS,
  DateTime midnightS,
  DateTime thuluthS,
}) =>
    serializers.toFirestore(
        PrayerTimesRecord.serializer,
        PrayerTimesRecord((p) => p
          ..lastupdate = lastupdate
          ..todate = todate
          ..galasI = galasI
          ..fajerI = fajerI
          ..sunsetI = sunsetI
          ..sunoutI = sunoutI
          ..dohorI = dohorI
          ..aserI = aserI
          ..magrebI = magrebI
          ..ishaI = ishaI
          ..midnightI = midnightI
          ..thuluthI = thuluthI
          ..duhaI = duhaI
          ..galasS = galasS
          ..fajerS = fajerS
          ..sunsetS = sunsetS
          ..sunoutS = sunoutS
          ..duhaE = duhaE
          ..dohorS = dohorS
          ..aserS = aserS
          ..magrebS = magrebS
          ..ishaS = ishaS
          ..midnightS = midnightS
          ..thuluthS = thuluthS));
