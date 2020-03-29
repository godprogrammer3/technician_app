part of 'console_setting_bloc.dart';

abstract class ConsoleSettingState extends Equatable {
  const ConsoleSettingState();
}

class ConsoleSettingInitial extends ConsoleSettingState {
  @override
  List<Object> get props => [];
}

class ConsoleSettingReadyState extends ConsoleSettingState {
  @override
  final ConsoleSetting consoleSetting;
  ConsoleSettingReadyState({
    @required this.consoleSetting,
  });
  List<Object> get props => [
    consoleSetting
  ];

}
