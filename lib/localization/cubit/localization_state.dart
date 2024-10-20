// part of 'localization_cubit.dart';
//
// @freezed
// class LocalizationState with _$LocalizationState {
//   const factory LocalizationState.initial() = _Initial;
//   const factory LocalizationState.getCurrent() = _GetCurrent;
//   const factory LocalizationState.toAr() = _ToAr;
//   const factory LocalizationState.toEn() = _ToEn;
// }
import 'package:equatable/equatable.dart';

enum LocalizationStatus { initial, getCurrent, toAr, toEn }

class LocalizationState extends Equatable {
  final LocalizationStatus status;

  const LocalizationState(this.status);

  @override
  List<Object> get props => [status];

  factory LocalizationState.initial() => LocalizationState(LocalizationStatus.initial);

  factory LocalizationState.getCurrent() => LocalizationState(LocalizationStatus.getCurrent);

  factory LocalizationState.toAr() => LocalizationState(LocalizationStatus.toAr);

  factory LocalizationState.toEn() => LocalizationState(LocalizationStatus.toEn);
}
