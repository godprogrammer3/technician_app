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
  final int customBaudrateValue;
  ConsoleSettingReadyState({
    @required this.consoleSetting,
    @required this.customBaudrateValue
  });
  List<Object> get props => [
    consoleSetting,
    customBaudrateValue
  ];

}
