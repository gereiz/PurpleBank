import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_extrato_widget.dart' show AddExtratoWidget;
import 'package:flutter/material.dart';

class AddExtratoModel extends FlutterFlowModel<AddExtratoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Type widget.
  int? typeValue;
  FormFieldController<int>? typeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Origin widget.
  String? originValue;
  FormFieldController<String>? originValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransfersRecord? transferOk;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
