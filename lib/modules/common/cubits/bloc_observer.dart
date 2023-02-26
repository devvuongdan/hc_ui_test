import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class BlocAppObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Logger().d("[${bloc.runtimeType}] created");
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  // AppLogger.simpleI("[${bloc.runtimeType}] onChange");
  // AppLogger.simpleI(
  //   "[${bloc.runtimeType}] onChange\nCurrent state: ${change.currentState}\nNext state:    ${change.nextState}",
  // );
  // }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger().e("${bloc.runtimeType} onError", error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Logger().d("[${bloc.runtimeType}] closed");
  }
}
