/// API Response output

import 'package:flutter/cupertino.dart';

class APIResponseHandler extends StatelessWidget {
  /// This function will behave as an
  /// asynchronous function
  final Iterable<Future>? function;

  /// custom success screen
  final Widget Function(AsyncSnapshot?)? successScreen;

  /// custom loading screen
  final Widget loadingScreen;

  /// custom network error screen
  final Widget networkErrorScreen;

  /// custom error screen
  final Widget Function(Object?)? errorScreen;

  const APIResponseHandler({
    this.function,
    required this.successScreen,
    required this.loadingScreen,
    required this.networkErrorScreen,
    required this.errorScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// FutureBuilder Widget is used to create widgets based on
    /// the latest snapshot of interaction with a Future.
    ///
    /// FutureBuilder is a Widget that will help you to execute
    /// some asynchronous function and based on
    /// that function’s result your UI will update.
    return FutureBuilder(
      future: Future.wait(function!),
      builder: (BuildContext context, snapshot) {
        /// if we got our data
        if (snapshot.hasData) {
          /// return data from snapshot object
          return successScreen!(snapshot);
        }

        ///  If we got an error
        else if (snapshot.hasError) {
          /// return error screen
          return errorScreen!(snapshot.error);
        }

        /// ConnectionState.waiting: It means the future is being resolved,
        /// and we will get the result soon enough.
        else if (snapshot.connectionState == ConnectionState.waiting) {
          /// return loading screen to indicate waiting state
          return loadingScreen;
        }

        /// ConnectionState.none: It means that the future is null and
        /// initialData is used as defaultValue.
        else if (snapshot.connectionState == ConnectionState.none) {
          /// return network error screen to indicate
          /// connection error
          return networkErrorScreen;
        }

        /// Displaying LoadingSpinner to indicate waiting state
        return const Center(
          child: CupertinoActivityIndicator(
            radius: 18,
          ),
        );
      },
    );
  }
}
