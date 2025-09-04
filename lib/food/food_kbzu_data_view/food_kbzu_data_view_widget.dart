import '../../backend/supabase/supabase.dart';
import '../food_kbzu_summary_view/food_kbzu_summary_view_widget.dart';
import '/components/general_button_widget.dart';
import '/components/radio_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profile/profile_age_view/profile_age_view_widget.dart';
import '/profile/profile_gender_view/profile_gender_view_widget.dart';
import '/profile/profile_height_view/profile_height_view_widget.dart';
import '/profile/profile_weight_view/profile_weight_view_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'food_kbzu_data_view_model.dart';
export 'food_kbzu_data_view_model.dart';

class FoodKbzuDataViewWidget extends StatefulWidget {
  const FoodKbzuDataViewWidget({super.key});

  @override
  State<FoodKbzuDataViewWidget> createState() => _FoodKbzuDataViewWidgetState();
}

class _FoodKbzuDataViewWidgetState extends State<FoodKbzuDataViewWidget> {
  late FoodKbzuDataViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodKbzuDataViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF1A191D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ваши данные',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.unbounded(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Пол',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x23000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.viewInsetsOf(context),
                                          child: ProfileGenderViewWidget(
                                            initValue: _model.gender,
                                            onSelect: (int value) {
                                              _model.gender = value;
                                              setState(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF242328),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.gender == null)
                                            Expanded(
                                              child: Text(
                                                'Выберите пол',
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          if (_model.gender != null)
                                            Expanded(
                                              child: Text(
                                                _model.gender == 0 ? 'Мужской' : 'Женский',
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          if (_model.gender == null)
                                            Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              size: 14.0,
                                            ),
                                          if (_model.gender != null)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                _model.gender = null;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 16.0,
                                                ),
                                              ),
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
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Возраст',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x23000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.viewInsetsOf(context),
                                          child: ProfileAgeViewWidget(
                                            initDateTime: DateTime.now(),
                                            onSelect: (int value) {
                                              _model.age = value;
                                              setState(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF242328),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.age == null)
                                            Expanded(
                                              child: Text(
                                                '21',
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          if (_model.age != null)
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.age?.toString(),
                                                  '-',
                                                ),
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          Text(
                                            'лет',
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                          if (_model.age == null)
                                            Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              size: 14.0,
                                            ),
                                          if (_model.age != null)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                _model.age = null;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 16.0,
                                                ),
                                              ),
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
                      ].divide(SizedBox(width: 9.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Рост',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x23000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.viewInsetsOf(context),
                                          child: ProfileHeightViewWidget(
                                            initValue: _model.height ?? 160,
                                            onSelect: (double value) {
                                              _model.height = value;
                                              setState(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF242328),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.gender == null)
                                            Expanded(
                                              child: Text(
                                                '175',
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          if (_model.height != null)
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.height?.toString(),
                                                  '-',
                                                ),
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          Text(
                                            'см',
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                          if (_model.gender == null)
                                            Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              size: 14.0,
                                            ),
                                          if (_model.height != null)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                _model.height = null;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 16.0,
                                                ),
                                              ),
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
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Вес',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x23000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.viewInsetsOf(context),
                                          child: ProfileWeightViewWidget(
                                            initValue: _model.weight ?? 50,
                                            onSelect: (double value) {
                                              _model.weight = value;
                                              setState(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF242328),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (_model.weight == null)
                                            Expanded(
                                              child: Text(
                                                '65',
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          if (_model.weight != null)
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.weight?.toString(),
                                                  '-',
                                                ),
                                                maxLines: 1,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          Text(
                                            'кг',
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                          if (_model.weight == null)
                                            Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              size: 14.0,
                                            ),
                                          if (_model.weight != null)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                _model.weight = null;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 16.0,
                                                ),
                                              ),
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
                      ].divide(SizedBox(width: 9.0)),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Уровень активности',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.unbounded(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFF302E36),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.activityLevel = 0;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.radioButtonModel1,
                                          updateCallback: () => safeSetState(() {}),
                                          child: RadioButtonWidget(
                                            checked: _model.activityLevel == 0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Минимальная (сидячий образ жизни)',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF302E36),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.activityLevel = 1;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.radioButtonModel2,
                                          updateCallback: () => safeSetState(() {}),
                                          child: RadioButtonWidget(
                                            checked: _model.activityLevel == 1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Низкая (лёгкие упражнения \n1–3 разав неделю)',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF302E36),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.activityLevel = 2;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.radioButtonModel3,
                                          updateCallback: () => safeSetState(() {}),
                                          child: RadioButtonWidget(
                                            checked: _model.activityLevel == 2,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Средняя (умеренные упражнения \n3–5 раз в неделю)',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF302E36),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.activityLevel = 3;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.radioButtonModel4,
                                          updateCallback: () => safeSetState(() {}),
                                          child: RadioButtonWidget(
                                            checked: _model.activityLevel == 3,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Высокая (интенсивные упражнения \n6–7 раз в неделю)',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Цель',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.unbounded(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Color(0xFF302E36),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.goal = 0;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.radioButtonModel5,
                                          updateCallback: () => safeSetState(() {}),
                                          child: RadioButtonWidget(
                                            checked: _model.goal == 0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Снижение веса',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF302E36),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.goal = 1;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.radioButtonModel6,
                                          updateCallback: () => safeSetState(() {}),
                                          child: RadioButtonWidget(
                                            checked: _model.goal == 1,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Поддержание веса',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF302E36),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.goal = 2;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.radioButtonModel7,
                                          updateCallback: () => safeSetState(() {}),
                                          child: RadioButtonWidget(
                                            checked: _model.goal == 2,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Набор массы',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: wrapWithModel(
                  model: _model.generalButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: GeneralButtonWidget(
                    title: 'Рассчитать КБЖУ',
                    isActive: (_model.gender != null) && (_model.age != null) && (_model.height != null) && (_model.weight != null) && (_model.activityLevel != null) && (_model.goal != null),
                    onTap: () async {
                      final gender = _model.gender;
                      final age = _model.age;
                      final height = _model.height;
                      final weight = _model.weight;
                      final activityLevel = _model.activityLevel;
                      final goal = _model.goal;

                      if (gender == null || age == null || height == null || weight == null || activityLevel == null || goal == null) return;

                      // Формула Миффлина-Сан Жеора
                      double bmr;
                      if (gender == 0) {
                        // Мужской
                        bmr = 10 * weight + 6.25 * height - 5 * age + 5;
                      } else {
                        // Женский
                        bmr = 10 * weight + 6.25 * height - 5 * age - 161;
                      }

                      // Множитель активности
                      const activityMultipliers = [1.2, 1.375, 1.55, 1.725];
                      final tdee = bmr * activityMultipliers[activityLevel];

                      // Цель
                      double targetCalories;
                      switch (goal) {
                        case 0:
                          targetCalories = tdee - 300; // снижение
                          break;
                        case 1:
                          targetCalories = tdee; // поддержание
                          break;
                        case 2:
                          targetCalories = tdee + 300; // набор
                          break;
                        default:
                          targetCalories = tdee;
                      }

                      // Макросы (в граммах)
                      final proteins = weight * 2.0;
                      final fats = weight * 1.0;
                      final remainingCalories = targetCalories - (proteins * 4 + fats * 9);
                      final carbs = remainingCalories / 4;

                      final kbzu = {
                        'kcal_target': targetCalories.round(),
                        'proteins_target': proteins.round(),
                        'fats_target': fats.round(),
                        'carbs_target': carbs.round(),
                      };

                      print('КБЖУ рассчитано: $kbzu');
                      // Сохраняем в Supabase
                      final currentUser = FirebaseAuth.instance.currentUser;
                      if (currentUser != null) {
                        await AppSupabase.instance.client
                            .from('usernutritiondata')
                            .upsert({
                              'user_id': currentUser.uid,
                              'weight_kg': weight,
                              'height_cm': height.round(),
                              'age': age,
                              'recommended_kbzu': kbzu,
                              'extra_data': {
                                'gender': gender,
                                'activity_level': activityLevel,
                                'goal': goal,
                              },
                            }, onConflict: 'user_id');

                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x3C000000),
                          enableDrag: false,
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: FoodKbzuSummaryViewWidget(
                                kbzu: kbzu,
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        // context.safePop();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
