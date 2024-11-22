import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/confirm_dialog/confirm_dialog_widget.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'daily_test_page_model.dart';
export 'daily_test_page_model.dart';

class DailyTestPageWidget extends StatefulWidget {
  const DailyTestPageWidget({
    super.key,
    String? setId,
    required this.coins,
  }) : setId = setId ?? 'hello';

  final String setId;
  final int? coins;

  @override
  State<DailyTestPageWidget> createState() => _DailyTestPageWidgetState();
}

class _DailyTestPageWidgetState extends State<DailyTestPageWidget> {
  late DailyTestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailyTestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: const ConfirmDialogWidget(),
            ),
          );
        },
      );

      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: StreamBuilder<List<LeaderboardRecord>>(
              stream: queryLeaderboardRecord(
                queryBuilder: (leaderboardRecord) => leaderboardRecord.where(
                  'user',
                  isEqualTo: currentUserUid,
                ),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<LeaderboardRecord> columnLeaderboardRecordList =
                    snapshot.data!;
                final columnLeaderboardRecord =
                    columnLeaderboardRecordList.isNotEmpty
                        ? columnLeaderboardRecordList.first
                        : null;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFF6354C6),
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6354C6),
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: const Color(0xFF6962A6),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.alarm,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 24.0,
                                          ),
                                        ),
                                        FlutterFlowTimer(
                                          initialTime:
                                              _model.timerInitialTimeMs,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval:
                                              const Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate) {
                                              safeSetState(() {});
                                            }
                                          },
                                          onEnded: () async {
                                            if (_model.questNum! < 20) {
                                              await _model.pageViewController
                                                  ?.nextPage(
                                                duration:
                                                    const Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );

                                              safeSetState(() {});
                                            } else {
                                              admob.loadInterstitialAd(
                                                "",
                                                "ca-app-pub-4792951576672245/8728465505",
                                                false,
                                              );

                                              await columnLeaderboardRecord!
                                                  .reference
                                                  .update(
                                                      createLeaderboardRecordData(
                                                quizScore: _model.quizScore,
                                                coins: FFAppState().coinsApp,
                                              ));

                                              await columnLeaderboardRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'totalScore':
                                                        FieldValue.increment(
                                                            _model.quizScore),
                                                  },
                                                ),
                                              });

                                              _model.interstitialAdSuccess1 =
                                                  await admob
                                                      .showInterstitialAd();

                                              context.pushNamed('submitPage');
                                            }

                                            safeSetState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Container(
                                  width: 90.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6354C6),
                                    borderRadius: BorderRadius.circular(24.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${FFAppState().coinsApp.toString()}    ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        const FaIcon(
                                          FontAwesomeIcons.coins,
                                          color: Color(0xFFF4F407),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAE1E1),
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                  color: const Color(0xFFF4B0B0),
                                  width: 3.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Score: ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.quizScore.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.65,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FutureBuilder<ApiCallResponse>(
                                  future: DailyTestApiCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final pageViewDailyTestApiResponse =
                                        snapshot.data!;

                                    return Builder(
                                      builder: (context) {
                                        final dailyQuestData =
                                            (DailyTestApiCall.questions(
                                                      pageViewDailyTestApiResponse
                                                          .jsonBody,
                                                    )?.toList() ??
                                                    [])
                                                .take(20)
                                                .toList();

                                        return SizedBox(
                                          width: double.infinity,
                                          height: 500.0,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 40.0),
                                            child: PageView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              controller: _model
                                                      .pageViewController ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              dailyQuestData
                                                                      .length -
                                                                  1))),
                                              onPageChanged: (_) async {
                                                _model.timerController
                                                    .onResetTimer();

                                                _model.timerController
                                                    .onStartTimer();
                                              },
                                              scrollDirection: Axis.horizontal,
                                              itemCount: dailyQuestData.length,
                                              itemBuilder: (context,
                                                  dailyQuestDataIndex) {
                                                final dailyQuestDataItem =
                                                    dailyQuestData[
                                                        dailyQuestDataIndex];
                                                return Container(
                                                  width: 100.0,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      primary: false,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFF6C4ED),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14.0),
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xFFED89DB),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      'Question ${_model.questNum?.toString()}:',
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          fontSize:
                                                                              24.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          20.0,
                                                                          12.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                        dailyQuestDataItem,
                                                                        r'''$.question''',
                                                                      )?.toString(),
                                                                      '\$.question',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        40.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final answerOptions =
                                                                    getJsonField(
                                                                  dailyQuestDataItem,
                                                                  r'''$.options''',
                                                                ).toList();

                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.selectedAns =
                                                                        '';
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: ListView
                                                                      .separated(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                      0,
                                                                      12.0,
                                                                      0,
                                                                      12.0,
                                                                    ),
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        answerOptions
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        const SizedBox(
                                                                            height:
                                                                                20.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            answerOptionsIndex) {
                                                                      final answerOptionsItem =
                                                                          answerOptions[
                                                                              answerOptionsIndex];
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.selectedAns =
                                                                              answerOptionsItem.toString();
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.soundPlayer1 ??=
                                                                              AudioPlayer();
                                                                          if (_model
                                                                              .soundPlayer1!
                                                                              .playing) {
                                                                            await _model.soundPlayer1!.stop();
                                                                          }
                                                                          _model
                                                                              .soundPlayer1!
                                                                              .setVolume(1.0);
                                                                          _model
                                                                              .soundPlayer1!
                                                                              .setAsset('assets/audios/ui-mechanical-button-click-gfx-sounds-1-1-00-00.mp3')
                                                                              .then((_) => _model.soundPlayer1!.play());
                                                                        },
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              3.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            constraints:
                                                                                const BoxConstraints(
                                                                              minHeight: 45.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: _model.selectedAns != null && _model.selectedAns != '' ? (_model.selectedAns == answerOptionsItem.toString() ? FlutterFlowTheme.of(context).primary : const Color(0xFFDDD9F9)) : const Color(0xFFC7BFFD),
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              border: Border.all(
                                                                                color: _model.nextSelected
                                                                                    ? (answerOptionsItem ==
                                                                                            getJsonField(
                                                                                              dailyQuestDataItem,
                                                                                              r'''$.correct_answer''',
                                                                                            )
                                                                                        ? FlutterFlowTheme.of(context).secondary
                                                                                        : const Color(0xFFE40808))
                                                                                    : FlutterFlowTheme.of(context).primary,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 2.0, 0.0),
                                                                              child: Text(
                                                                                answerOptionsItem.toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        40.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      admob
                                                                          .loadInterstitialAd(
                                                                        "",
                                                                        "ca-app-pub-4792951576672245/8728465505",
                                                                        false,
                                                                      );

                                                                      await columnLeaderboardRecord!
                                                                          .reference
                                                                          .update(
                                                                              createLeaderboardRecordData(
                                                                        coins: FFAppState()
                                                                            .coinsApp,
                                                                      ));

                                                                      await columnLeaderboardRecord
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'totalScore':
                                                                                FieldValue.increment(_model.quizScore),
                                                                          },
                                                                        ),
                                                                      });
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              300));

                                                                      _model.interstitialAdSuccess =
                                                                          await admob
                                                                              .showInterstitialAd();

                                                                      context.pushNamed(
                                                                          'submitPage');

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Submit',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.4,
                                                                      height:
                                                                          60.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: const Color(
                                                                          0xFF6CCCC1),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (_model.selectedAns !=
                                                                            null &&
                                                                        _model.selectedAns !=
                                                                            '') {
                                                                      _model.nextSelected =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      _model
                                                                          .isCorrect = _model
                                                                              .selectedAns ==
                                                                          getJsonField(
                                                                            dailyQuestDataItem,
                                                                            r'''$.correct_answer''',
                                                                          ).toString();
                                                                      safeSetState(
                                                                          () {});
                                                                      if (_model
                                                                          .isCorrect!) {
                                                                        _model.soundPlayer2 ??=
                                                                            AudioPlayer();
                                                                        if (_model
                                                                            .soundPlayer2!
                                                                            .playing) {
                                                                          await _model
                                                                              .soundPlayer2!
                                                                              .stop();
                                                                        }
                                                                        _model
                                                                            .soundPlayer2!
                                                                            .setVolume(1.0);
                                                                        _model
                                                                            .soundPlayer2!
                                                                            .setAsset(
                                                                                'assets/audios/correctAnswerSound.mp3')
                                                                            .then((_) =>
                                                                                _model.soundPlayer2!.play());

                                                                        _model.quizScore =
                                                                            _model.quizScore +
                                                                                10;
                                                                        safeSetState(
                                                                            () {});
                                                                        FFAppState()
                                                                            .coinsApp = FFAppState()
                                                                                .coinsApp +
                                                                            10;
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        _model.soundPlayer3 ??=
                                                                            AudioPlayer();
                                                                        if (_model
                                                                            .soundPlayer3!
                                                                            .playing) {
                                                                          await _model
                                                                              .soundPlayer3!
                                                                              .stop();
                                                                        }
                                                                        _model
                                                                            .soundPlayer3!
                                                                            .setVolume(1.0);
                                                                        _model
                                                                            .soundPlayer3!
                                                                            .setAsset(
                                                                                'assets/audios/wrongAnswerSound.mp3')
                                                                            .then((_) =>
                                                                                _model.soundPlayer3!.play());

                                                                        FFAppState()
                                                                            .coinsApp = FFAppState()
                                                                                .coinsApp +
                                                                            -5;
                                                                        safeSetState(
                                                                            () {});
                                                                      }

                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              2000));
                                                                      _model.selectedAns =
                                                                          '';
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.nextSelected =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    await _model
                                                                        .pageViewController
                                                                        ?.nextPage(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Next ->',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.4,
                                                                    height:
                                                                        60.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: const Color(
                                                                        0xFFFFA500),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            14.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FlutterFlowAdBanner(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 58.0,
                      showsTestAd: false,
                      androidAdUnitID: 'ca-app-pub-4792951576672245/7076085441',
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
