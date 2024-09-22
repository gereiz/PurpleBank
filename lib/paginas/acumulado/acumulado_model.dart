import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'acumulado_widget.dart' show AcumuladoWidget;
import 'package:flutter/material.dart';

class AcumuladoModel extends FlutterFlowModel<AcumuladoWidget> {
  ///  Local state fields for this page.

  double? entradas;

  double? saidas;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  List<TransfersRecord>? entradasPreviousSnapshot;
  List<TransfersRecord>? saidasPreviousSnapshot;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
