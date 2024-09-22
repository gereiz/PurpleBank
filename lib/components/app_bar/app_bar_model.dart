import '/flutter_flow/flutter_flow_util.dart';
import 'app_bar_widget.dart' show AppBarWidget;
import 'package:flutter/material.dart';

class AppBarModel extends FlutterFlowModel<AppBarWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
