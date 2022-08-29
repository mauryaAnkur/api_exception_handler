
import 'package:api_exception_handler/API%20Handler/ExceptionHandlers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Repository/api_repository.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {

    final ApiRepository _apiRepository = ApiRepository();

    on<ApiEvent>((event, emit) async{

      try{
        emit(ApiLoading());
        final data = await _apiRepository.getDataFromApi();
        emit(ApiLoaded(data));
      } catch(e) {
        emit(ApiError(ExceptionHandlers().getExceptionString(e)));
      }


    });
  }
}
