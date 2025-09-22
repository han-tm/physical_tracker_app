import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'delete_account_view_model.dart';
export 'delete_account_view_model.dart';

class DeleteAccountViewWidget extends StatefulWidget {
  const DeleteAccountViewWidget({super.key});

  @override
  State<DeleteAccountViewWidget> createState() =>
      _DeleteAccountViewWidgetState();
}

class _DeleteAccountViewWidgetState extends State<DeleteAccountViewWidget> {
  late DeleteAccountViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
