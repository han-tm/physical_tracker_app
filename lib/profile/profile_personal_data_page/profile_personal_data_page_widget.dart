// import 'package:boom_client/components/general_button_widget.dart';
//
// import '/components/general_nav_bar01_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'profile_personal_data_page_model.dart';
// export 'profile_personal_data_page_model.dart';
//
// class ProfilePersonalDataPageWidget extends StatefulWidget {
//   const ProfilePersonalDataPageWidget({super.key});
//
//   static String routeName = 'ProfilePersonalDataPage';
//   static String routePath = '/profilePersonalDataPage';
//
//   @override
//   State<ProfilePersonalDataPageWidget> createState() =>
//       _ProfilePersonalDataPageWidgetState();
// }
//
// class _ProfilePersonalDataPageWidgetState
//     extends State<ProfilePersonalDataPageWidget> {
//   late ProfilePersonalDataPageModel _model;
//
//   final TextEditingController _nameController = TextEditingController(text: 'Анастасия');
//   final TextEditingController _ageController = TextEditingController(text: '25');
//   final TextEditingController _heightController = TextEditingController(text: '165');
//   final TextEditingController _weightController = TextEditingController(text: '55');
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => ProfilePersonalDataPageModel());
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//     _nameController.dispose();
//     _ageController.dispose();
//     _heightController.dispose();
//     _weightController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               wrapWithModel(
//                 model: _model.generalNavBar01Model,
//                 updateCallback: () => safeSetState(() {}),
//                 child: GeneralNavBar01Widget(
//                   title: 'Личные данные',
//                   hideBack: false,
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Column(
//                             children: [
//                               SizedBox(height: 32),
//                               // Profile Photo
//                               Container(
//                                 width: 96,
//                                 height: 96,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color(0xFFC4C4C4),
//                                 ),
//                                 child: Icon(
//                                   Icons.person,
//                                   size: 48,
//                                   color: Color(0xFF999999),
//                                 ),
//                               ),
//                               SizedBox(height: 16),
//
//                               // Form Fields
//                               Container(
//                                 // constraints: BoxConstraints(maxWidth: 343),
//                                 child: Column(
//                                   children: [
//                                     _buildInputField(
//                                       title: 'Как вас зовут?',
//                                       controller: _nameController,
//                                     ),
//                                     SizedBox(height: 8),
//                                     _buildInputField(
//                                       title: 'Возраст',
//                                       controller: _ageController,
//                                       unit: 'Лет',
//                                       showArrow: true,
//                                     ),
//                                     SizedBox(height: 8),
//                                     _buildInputField(
//                                       title: 'Рост',
//                                       controller: _heightController,
//                                       unit: 'См',
//                                       showArrow: true,
//                                     ),
//                                     SizedBox(height: 8),
//                                     _buildInputField(
//                                       title: 'Вес',
//                                       controller: _weightController,
//                                       unit: 'Кг',
//                                       showArrow: true,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           // Delete Account Button
//                           Container(
//                             margin: EdgeInsets.only(top: 16),
//                             constraints: BoxConstraints(maxWidth: 343),
//                             width: double.infinity,
//                             child: OutlinedButton.icon(
//                               onPressed: () {
//                                 // Handle delete account
//                               },
//                               icon: Icon(
//                                 Icons.delete_outline,
//                                 color: Colors.red,
//                                 size: 16,
//                               ),
//                               label: Text(
//                                 'Удалить аккаунт',
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 side: BorderSide(color: Color(0xFF302E36)),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(24),
//                                 ),
//                                 padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 16),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(16),
//                 child: GeneralButtonWidget(
//                     title: "Сохранить",
//                     isActive: true,
//                     onTap: () async {
//
//                     }
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInputField({
//     required String title,
//     required TextEditingController controller,
//     String? unit,
//     bool showArrow = false,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             color: Color(0xFF696576),
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//             height: 1.33,
//           ),
//         ),
//         SizedBox(height: 4),
//         Container(
//           decoration: BoxDecoration(
//             color: Color(0xFF242328),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: TextField(
//             controller: controller,
//             style: TextStyle(
//               color: Color(0xFFF2F2F3),
//               fontSize: 15,
//               fontWeight: FontWeight.w400,
//               height: 1.33,
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.all(12),
//               suffixIcon: (unit != null || showArrow)
//                   ? Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (unit != null)
//                     Text(
//                       unit,
//                       style: TextStyle(
//                         color: Color(0xFF696576),
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   if (showArrow)
//                     Icon(
//                       Icons.chevron_right,
//                       color: Color(0xFFF2F2F3),
//                       size: 18,
//                     ),
//                   SizedBox(width: 4),
//                 ],
//               )
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'package:boom_client/backend/supabase/database/database.dart';
import 'package:boom_client/backend/supabase/database/tables/user.dart';
import 'package:boom_client/components/general_button_widget.dart';
import 'package:boom_client/profile/profile_age_view/profile_age_view_widget.dart';
import 'package:boom_client/profile/profile_height_view/profile_height_view_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../profile_weight_view/profile_weight_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/components/general_nav_bar01_widget.dart';
import 'package:flutter/material.dart';

class ProfilePersonalDataPageWidget extends StatefulWidget {
  const ProfilePersonalDataPageWidget({super.key});

  static String routeName = 'ProfilePersonalDataPage';
  static String routePath = '/profilePersonalDataPage';

  @override
  State<ProfilePersonalDataPageWidget> createState() => _ProfilePersonalDataPageWidgetState();
}

class _ProfilePersonalDataPageWidgetState extends State<ProfilePersonalDataPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _nameController = TextEditingController();
  String? imageUrl;
  int? age;
  double? height;
  double? weight;

  bool _hasChanges = false;
  UserRow? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final res = await UserTable().querySingleRow(
      queryFn: (q) => q.eq('fb_id', currentUserUid),
    );

    if (res.isNotEmpty) {
      user = res.first;
      setState(() {
        _nameController.text = user?.name ?? '';
        imageUrl = user?.image;
        age = user?.age;
        height = user?.height;
        weight = user?.weight;
      });
    }
  }

  Future<void> _saveUser() async {
    if (user == null) return;

    await UserTable().update(
      data: {
        'name': _nameController.text,
        'image': imageUrl,
      },
      matchingRows: (r) => r.eq('id', user!.id),
    );

    setState(() {
      _hasChanges = false;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    final file = File(picked.path);
    final filename = '${currentUserUid}_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final storage = Supabase.instance.client.storage;
    final bucket = storage.from('boom-bucket');
    final res = await bucket.upload('avatars/$filename', file);

    final publicUrl = bucket.getPublicUrl('avatars/$filename');
    setState(() {
      imageUrl = publicUrl;
      _hasChanges = true;
    });
  }

  void _onNameChanged(String value) {
    setState(() => _hasChanges = true);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            GeneralNavBar01Widget(title: 'Личные данные', hideBack: false),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
                        backgroundColor: const Color(0xFFC4C4C4),
                        child: imageUrl == null ? const Icon(Icons.person, size: 48, color: Color(0xFF999999)) : null,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildInputField(
                      title: 'Как вас зовут?',
                      controller: _nameController,
                      onChanged: _onNameChanged,
                    ),
                    const SizedBox(height: 12),
                    _buildStaticButton('Возраст', age?.toString() ?? '-', 'Лет'),
                    const SizedBox(height: 12),
                    _buildStaticButton('Рост', height?.toString() ?? '-', 'См'),
                    const SizedBox(height: 12),
                    _buildStaticButton('Вес', weight?.toString() ?? '-', 'Кг'),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline, color: Colors.red, size: 16),
                        label: const Text(
                          'Удалить аккаунт',
                          style: TextStyle(color: Colors.red, fontSize: 15, fontFamily: 'Unbounded'),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF302E36)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GeneralButtonWidget(
                title: 'Сохранить',
                isActive: _hasChanges,
                onTap: _hasChanges ? _saveUser : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String title,
    required TextEditingController controller,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Color(0xFF696576), fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF242328),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: const TextStyle(color: Color(0xFFF2F2F3), fontSize: 15),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStaticButton(String title, String value, String unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Color(0xFF696576), fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Color(0x1F000000),
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: title == "Возраст"
                        ? ProfileAgeViewWidget(
                            initDateTime: DateTime.now().subtract(Duration(days: 365 * 10)),
                            onSelect: (value) async {
                              await UserTable().update(
                                data: {
                                  'age': value,
                                },
                                matchingRows: (rows) => rows.eqOrNull(
                                  'fb_id',
                                  currentUserUid,
                                ),
                              );
                              await _loadUser();
                              setState(() {});
                            },
                          )
                        : title == "Рост"
                            ? ProfileHeightViewWidget(
                                initValue: user?.height ?? 160,
                                onSelect: (value) async {
                                  await UserTable().update(
                                    data: {
                                      'height': value,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'fb_id',
                                      currentUserUid,
                                    ),
                                  );
                                  await _loadUser();
                                  setState(() {});
                                },
                              )
                            : title == "Вес"
                                ? ProfileWeightViewWidget(
                                    initValue: user?.weight ?? 50,
                                    onSelect: (value) async {
                                      await UserTable().update(
                                        data: {
                                          'weight': value,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'fb_id',
                                          currentUserUid,
                                        ),
                                      );
                                      await _loadUser();
                                      setState(() {});
                                    },
                                  )
                                : Container(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF242328),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(color: Color(0xFFF2F2F3), fontSize: 15),
                  ),
                ),
                Text(unit, style: const TextStyle(color: Color(0xFF696576), fontSize: 15)),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right, color: Color(0xFFF2F2F3), size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
