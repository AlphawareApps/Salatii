import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../intro_copy/intro_copy_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditWidget extends StatefulWidget {
  const EditWidget({Key key}) : super(key: key);

  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  DateTime datePicked10;
  DateTime datePicked1;
  DateTime datePicked2;
  DateTime datePicked3;
  DateTime datePicked4;
  DateTime datePicked5;
  DateTime datePicked6;
  DateTime datePicked7;
  DateTime datePicked8;
  DateTime datePicked9;
  DateTime datePicked11;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Edit'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PrayerTimesRecord>>(
      stream: queryPrayerTimesRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).grayLight,
                size: 40,
              ),
            ),
          );
        }
        List<PrayerTimesRecord> editPrayerTimesRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final editPrayerTimesRecord = editPrayerTimesRecordList.isNotEmpty
            ? editPrayerTimesRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      child: Text(
                        'تعديل أوقات الصلاة',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'JFFlat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [],
              elevation: 0,
            ),
          ),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'الغلس',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      // pickGalas
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked1 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.galasS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        galasS: datePicked1,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.galasS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'الفجر',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked2 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.fajerS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        fajerS: datePicked2,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.fajerS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'طلوع الشمس',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked3 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.sunsetS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        sunsetS: datePicked3,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.sunsetS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'شروق الشمس',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked4 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.sunoutS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        sunoutS: datePicked4,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.sunoutS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'نهاية الضحى',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked5 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.duhaE,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        duhaE: datePicked5,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.duhaE),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'الظهر',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked6 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.dohorS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        dohorS: datePicked6,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.dohorS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'العصر',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked7 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.aserS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        aserS: datePicked7,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.aserS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'المغرب',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked8 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.magrebS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        magrebS: datePicked8,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.magrebS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'العشاء',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked9 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.ishaS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        ishaS: datePicked9,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.ishaS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'منتصف الليل',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked10 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.midnightS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        midnightS: datePicked10,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat('jm',
                                          editPrayerTimesRecord.midnightS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Text(
                                'ثلث الليل الأخير',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'JFFlat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showTimePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked11 = date);
                                        },
                                        currentTime:
                                            editPrayerTimesRecord.thuluthS,
                                        locale: LocaleType.values.firstWhere(
                                          (l) =>
                                              l.name ==
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          orElse: null,
                                        ),
                                      );

                                      final prayerTimesUpdateData =
                                          createPrayerTimesRecordData(
                                        thuluthS: datePicked11,
                                      );
                                      await editPrayerTimesRecord.reference
                                          .update(prayerTimesUpdateData);
                                    },
                                    child: Text(
                                      dateTimeFormat(
                                          'jm', editPrayerTimesRecord.thuluthS),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'JFFlat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final prayerTimesUpdateData =
                            createPrayerTimesRecordData(
                          galasS: datePicked1,
                          fajerS: datePicked2,
                          sunsetS: datePicked3,
                          sunoutS: datePicked4,
                          dohorS: datePicked6,
                          aserS: datePicked7,
                          magrebS: datePicked8,
                          ishaS: datePicked9,
                          midnightS: datePicked10,
                          thuluthS: datePicked11,
                          lastupdate: getCurrentTimestamp,
                          todate: '',
                          duhaE: datePicked5,
                        );
                        await editPrayerTimesRecord.reference
                            .update(prayerTimesUpdateData);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: IntroCopyWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'حفظ التغيرات',
                      options: FFButtonOptions(
                        width: 340,
                        height: 60,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'JFFlat',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
