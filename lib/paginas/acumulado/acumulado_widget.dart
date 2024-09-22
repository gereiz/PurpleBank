import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'acumulado_model.dart';
export 'acumulado_model.dart';

class AcumuladoWidget extends StatefulWidget {
  const AcumuladoWidget({super.key});

  @override
  State<AcumuladoWidget> createState() => _AcumuladoWidgetState();
}

class _AcumuladoWidgetState extends State<AcumuladoWidget> {
  late AcumuladoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcumuladoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                            ),
                            Text(
                              'Movimentações do Mês',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 2000));
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Erro'),
                                      content: const Text(
                                          'Erro ao acessar. Por favor, verifique a sua conexão ou atualize seu aplicativo.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                await Future.delayed(
                                    const Duration(milliseconds: 1000));
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth('login', context.mounted);
                              },
                              child: FaIcon(
                                FontAwesomeIcons.questionCircle,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: StreamBuilder<List<TransfersRecord>>(
                stream: queryTransfersRecord(),
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
                  List<TransfersRecord> containerTransfersRecordList =
                      snapshot.data!;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.86,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= dateTimeFormat(
                              "My",
                              containerTransfersRecordList.first.date,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                          ),
                          options:
                              List<String>.from(containerTransfersRecordList
                                  .map((e) => valueOrDefault<String>(
                                        dateTimeFormat(
                                          "My",
                                          e.date,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        'data',
                                      ))
                                  .toList()
                                  .unique((e) => e)),
                          optionLabels: containerTransfersRecordList
                              .map((e) => valueOrDefault<String>(
                                    dateTimeFormat(
                                      "MMMM y",
                                      e.date,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    'data',
                                  ))
                              .toList()
                              .unique((e) => e),
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue = val),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          hintText: dateTimeFormat(
                            "MMMM y",
                            containerTransfersRecordList.first.date,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 1.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 1.0, 0.0),
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        StreamBuilder<List<TransfersRecord>>(
                          stream: queryTransfersRecord(
                            queryBuilder: (transfersRecord) => transfersRecord
                                .where(
                                  'tipe',
                                  isEqualTo: 2,
                                )
                                .where(
                                  'client',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'datasearch',
                                  isEqualTo: _model.dropDownValue,
                                ),
                          )..listen((snapshot) {
                              List<TransfersRecord>
                                  entradasTransfersRecordList = snapshot;
                              if (_model.entradasPreviousSnapshot != null &&
                                  !const ListEquality(
                                          TransfersRecordDocumentEquality())
                                      .equals(entradasTransfersRecordList,
                                          _model.entradasPreviousSnapshot)) {
                                () async {
                                  _model.entradas = functions.sumAllFieldsList(
                                      entradasTransfersRecordList
                                          .map((e) => e.value)
                                          .toList());
                                  safeSetState(() {});

                                  safeSetState(() {});
                                }();
                              }
                              _model.entradasPreviousSnapshot = snapshot;
                            }),
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
                            List<TransfersRecord> entradasTransfersRecordList =
                                snapshot.data!;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: const Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Quanto entrou',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'R\$ ${formatNumber(
                                                  functions.sumAllFieldsList(
                                                      entradasTransfersRecordList
                                                          .map((e) => e.value)
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  format: '#,##0.00',
                                                  locale: 'pt_BR',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.chevronRight,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        StreamBuilder<List<TransfersRecord>>(
                          stream: queryTransfersRecord(
                            queryBuilder: (transfersRecord) => transfersRecord
                                .where(
                                  'tipe',
                                  isNotEqualTo: 2,
                                )
                                .where(
                                  'client',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'datasearch',
                                  isEqualTo: _model.dropDownValue,
                                ),
                          )..listen((snapshot) {
                              List<TransfersRecord> saidasTransfersRecordList =
                                  snapshot;
                              if (_model.saidasPreviousSnapshot != null &&
                                  !const ListEquality(
                                          TransfersRecordDocumentEquality())
                                      .equals(saidasTransfersRecordList,
                                          _model.saidasPreviousSnapshot)) {
                                () async {
                                  _model.saidas = functions.sumAllFieldsList(
                                      saidasTransfersRecordList
                                          .map((e) => e.value)
                                          .toList());
                                  safeSetState(() {});

                                  safeSetState(() {});
                                }();
                              }
                              _model.saidasPreviousSnapshot = snapshot;
                            }),
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
                            List<TransfersRecord> saidasTransfersRecordList =
                                snapshot.data!;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: const Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Quanto saiu',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'R\$ ${formatNumber(
                                                  functions.sumAllFieldsList(
                                                      saidasTransfersRecordList
                                                          .map((e) => e.value)
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  format: '#,##0.00',
                                                  locale: 'pt_BR',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.chevronRight,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        StreamBuilder<List<TransfersRecord>>(
                          stream: queryTransfersRecord(
                            queryBuilder: (transfersRecord) => transfersRecord
                                .where(
                                  'tipe',
                                  isNotEqualTo: 2,
                                )
                                .where(
                                  'client',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'datasearch',
                                  isEqualTo: _model.dropDownValue,
                                ),
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
                            List<TransfersRecord> totalTransfersRecordList =
                                snapshot.data!;

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: const Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Resultado',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Entradas menos saídas no Nubank este\nmês',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(height: 8.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                'R\$ ${formatNumber(
                                                  (_model.entradas!) -
                                                      (_model.saidas!),
                                                  formatType: FormatType.custom,
                                                  format: '#,##0.00',
                                                  locale: 'pt_BR',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.chevronRight,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
