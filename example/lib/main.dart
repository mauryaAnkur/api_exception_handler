import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_bloc/api_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ApiBloc _apiBloc = ApiBloc();

  @override
  Widget build(BuildContext context) {
    _apiBloc.add(GetData());
    return Scaffold(
      body: BlocProvider<ApiBloc>(
        create: (_) => _apiBloc,
        child: BlocListener<ApiBloc, ApiState>(
          listener: (context, state) {},
          child: BlocBuilder<ApiBloc, ApiState>(
            builder: (context, state) {
              if(state is ApiLoading) {
                return Center(child: CircularProgressIndicator(),);
              } else if(state is ApiError) {
                return Center(child: Text(state.message.toString()),);
              } else if(state is ApiLoaded) {
                return Center(child: Text(state.data.toString()),);
              } else {
                return Center(child: Text('Error ///'),);
              }
            },
          ),
        ),
      ),
    );
  }
}
