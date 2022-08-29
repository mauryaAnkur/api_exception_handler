part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiLoaded extends ApiState {
  var data;
  ApiLoaded(this.data);
}

class ApiError extends ApiState {
  final String? message;
  const ApiError(this.message);
}


