// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int duration) initial,
    required TResult Function(int duration) runInProgress,
    required TResult Function() runComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int duration)? initial,
    TResult? Function(int duration)? runInProgress,
    TResult? Function()? runComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int duration)? initial,
    TResult Function(int duration)? runInProgress,
    TResult Function()? runComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimerInitialState value) initial,
    required TResult Function(_TimerRunInProgressState value) runInProgress,
    required TResult Function(_TimerRunCompleteState value) runComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimerInitialState value)? initial,
    TResult? Function(_TimerRunInProgressState value)? runInProgress,
    TResult? Function(_TimerRunCompleteState value)? runComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimerInitialState value)? initial,
    TResult Function(_TimerRunInProgressState value)? runInProgress,
    TResult Function(_TimerRunCompleteState value)? runComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TimerInitialStateImplCopyWith<$Res> {
  factory _$$TimerInitialStateImplCopyWith(_$TimerInitialStateImpl value,
          $Res Function(_$TimerInitialStateImpl) then) =
      __$$TimerInitialStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int duration});
}

/// @nodoc
class __$$TimerInitialStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerInitialStateImpl>
    implements _$$TimerInitialStateImplCopyWith<$Res> {
  __$$TimerInitialStateImplCopyWithImpl(_$TimerInitialStateImpl _value,
      $Res Function(_$TimerInitialStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(_$TimerInitialStateImpl(
      null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerInitialStateImpl implements _TimerInitialState {
  const _$TimerInitialStateImpl(this.duration);

  @override
  final int duration;

  @override
  String toString() {
    return 'TimerState.initial(duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerInitialStateImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerInitialStateImplCopyWith<_$TimerInitialStateImpl> get copyWith =>
      __$$TimerInitialStateImplCopyWithImpl<_$TimerInitialStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int duration) initial,
    required TResult Function(int duration) runInProgress,
    required TResult Function() runComplete,
  }) {
    return initial(duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int duration)? initial,
    TResult? Function(int duration)? runInProgress,
    TResult? Function()? runComplete,
  }) {
    return initial?.call(duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int duration)? initial,
    TResult Function(int duration)? runInProgress,
    TResult Function()? runComplete,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimerInitialState value) initial,
    required TResult Function(_TimerRunInProgressState value) runInProgress,
    required TResult Function(_TimerRunCompleteState value) runComplete,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimerInitialState value)? initial,
    TResult? Function(_TimerRunInProgressState value)? runInProgress,
    TResult? Function(_TimerRunCompleteState value)? runComplete,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimerInitialState value)? initial,
    TResult Function(_TimerRunInProgressState value)? runInProgress,
    TResult Function(_TimerRunCompleteState value)? runComplete,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TimerInitialState implements TimerState {
  const factory _TimerInitialState(final int duration) =
      _$TimerInitialStateImpl;

  int get duration;
  @JsonKey(ignore: true)
  _$$TimerInitialStateImplCopyWith<_$TimerInitialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerRunInProgressStateImplCopyWith<$Res> {
  factory _$$TimerRunInProgressStateImplCopyWith(
          _$TimerRunInProgressStateImpl value,
          $Res Function(_$TimerRunInProgressStateImpl) then) =
      __$$TimerRunInProgressStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int duration});
}

/// @nodoc
class __$$TimerRunInProgressStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerRunInProgressStateImpl>
    implements _$$TimerRunInProgressStateImplCopyWith<$Res> {
  __$$TimerRunInProgressStateImplCopyWithImpl(
      _$TimerRunInProgressStateImpl _value,
      $Res Function(_$TimerRunInProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(_$TimerRunInProgressStateImpl(
      null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerRunInProgressStateImpl implements _TimerRunInProgressState {
  const _$TimerRunInProgressStateImpl(this.duration);

  @override
  final int duration;

  @override
  String toString() {
    return 'TimerState.runInProgress(duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunInProgressStateImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerRunInProgressStateImplCopyWith<_$TimerRunInProgressStateImpl>
      get copyWith => __$$TimerRunInProgressStateImplCopyWithImpl<
          _$TimerRunInProgressStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int duration) initial,
    required TResult Function(int duration) runInProgress,
    required TResult Function() runComplete,
  }) {
    return runInProgress(duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int duration)? initial,
    TResult? Function(int duration)? runInProgress,
    TResult? Function()? runComplete,
  }) {
    return runInProgress?.call(duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int duration)? initial,
    TResult Function(int duration)? runInProgress,
    TResult Function()? runComplete,
    required TResult orElse(),
  }) {
    if (runInProgress != null) {
      return runInProgress(duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimerInitialState value) initial,
    required TResult Function(_TimerRunInProgressState value) runInProgress,
    required TResult Function(_TimerRunCompleteState value) runComplete,
  }) {
    return runInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimerInitialState value)? initial,
    TResult? Function(_TimerRunInProgressState value)? runInProgress,
    TResult? Function(_TimerRunCompleteState value)? runComplete,
  }) {
    return runInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimerInitialState value)? initial,
    TResult Function(_TimerRunInProgressState value)? runInProgress,
    TResult Function(_TimerRunCompleteState value)? runComplete,
    required TResult orElse(),
  }) {
    if (runInProgress != null) {
      return runInProgress(this);
    }
    return orElse();
  }
}

abstract class _TimerRunInProgressState implements TimerState {
  const factory _TimerRunInProgressState(final int duration) =
      _$TimerRunInProgressStateImpl;

  int get duration;
  @JsonKey(ignore: true)
  _$$TimerRunInProgressStateImplCopyWith<_$TimerRunInProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerRunCompleteStateImplCopyWith<$Res> {
  factory _$$TimerRunCompleteStateImplCopyWith(
          _$TimerRunCompleteStateImpl value,
          $Res Function(_$TimerRunCompleteStateImpl) then) =
      __$$TimerRunCompleteStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerRunCompleteStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerRunCompleteStateImpl>
    implements _$$TimerRunCompleteStateImplCopyWith<$Res> {
  __$$TimerRunCompleteStateImplCopyWithImpl(_$TimerRunCompleteStateImpl _value,
      $Res Function(_$TimerRunCompleteStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerRunCompleteStateImpl implements _TimerRunCompleteState {
  const _$TimerRunCompleteStateImpl();

  @override
  String toString() {
    return 'TimerState.runComplete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunCompleteStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int duration) initial,
    required TResult Function(int duration) runInProgress,
    required TResult Function() runComplete,
  }) {
    return runComplete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int duration)? initial,
    TResult? Function(int duration)? runInProgress,
    TResult? Function()? runComplete,
  }) {
    return runComplete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int duration)? initial,
    TResult Function(int duration)? runInProgress,
    TResult Function()? runComplete,
    required TResult orElse(),
  }) {
    if (runComplete != null) {
      return runComplete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimerInitialState value) initial,
    required TResult Function(_TimerRunInProgressState value) runInProgress,
    required TResult Function(_TimerRunCompleteState value) runComplete,
  }) {
    return runComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimerInitialState value)? initial,
    TResult? Function(_TimerRunInProgressState value)? runInProgress,
    TResult? Function(_TimerRunCompleteState value)? runComplete,
  }) {
    return runComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimerInitialState value)? initial,
    TResult Function(_TimerRunInProgressState value)? runInProgress,
    TResult Function(_TimerRunCompleteState value)? runComplete,
    required TResult orElse(),
  }) {
    if (runComplete != null) {
      return runComplete(this);
    }
    return orElse();
  }
}

abstract class _TimerRunCompleteState implements TimerState {
  const factory _TimerRunCompleteState() = _$TimerRunCompleteStateImpl;
}
