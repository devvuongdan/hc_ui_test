// import 'package:flutter/material.dart';
// import 'package:mbbank_retail_flutter/modules/common/bloc/user_type/user_type_cubit.dart';
// import 'package:mbbank_retail_flutter/modules/common/component/navigation/navigation_top/navigation_top.dart';
// import 'package:mbbank_retail_flutter/modules/common/component/screens/base_scaffold/models/base_scaffold_configs.dart';
// import 'package:mbbank_retail_flutter/modules/common/theme/cubit/theme_cubit.dart';


// class _BaseScaffoldPrivate extends StatelessWidget {
//   final BaseScaffoldConfigs configs;

//   const _BaseScaffoldPrivate({
//     required this.configs,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: configs.backgroundDecoration ??
//           BoxDecoration(
//             color: configs.backgroundColor,
//             gradient: configs.backgroundColor == null
//                 ? themeData.color.backgroundMain
//                 : null,
//           ),
//       child: Scaffold(
//         key: configs.key,
//         appBar: configs.customNavigationTop ??
//             (configs.navigationTopConfigs == null
//                 ? null
//                 : NavigationTop(
//                     configs: configs.navigationTopConfigs!.copyWith(
//                       drawerGlobalKey: configs.key,
//                     ),
//                   )),
//         extendBody: configs.extendBody,
//         extendBodyBehindAppBar: configs.extendBodyBehindAppBar,
//         floatingActionButton: configs.floatingActionButton,
//         floatingActionButtonLocation: configs.floatingActionButtonLocation,
//         floatingActionButtonAnimator: configs.floatingActionButtonAnimator,
//         persistentFooterButtons: configs.persistentFooterButtons,
//         persistentFooterAlignment: configs.persistentFooterAlignment,
//         drawer: configs.drawer,
//         onDrawerChanged: configs.onDrawerChanged,
//         endDrawer: configs.endDrawer,
//         onEndDrawerChanged: configs.onEndDrawerChanged,
//         drawerScrimColor: configs.drawerScrimColor,
//         backgroundColor: Colors.transparent,
//         bottomNavigationBar: configs.bottomNavigationBar,
//         bottomSheet: configs.bottomSheet,
//         resizeToAvoidBottomInset: configs.resizeToAvoidBottomInset,
//         drawerDragStartBehavior: configs.drawerDragStartBehavior,
//         drawerEdgeDragWidth: configs.drawerEdgeDragWidth,
//         drawerEnableOpenDragGesture: configs.drawerEnableOpenDragGesture,
//         endDrawerEnableOpenDragGesture: configs.endDrawerEnableOpenDragGesture,
//         restorationId: configs.restorationId,
//         body: configs.body,
//       ),
//     );
//   }
// }
