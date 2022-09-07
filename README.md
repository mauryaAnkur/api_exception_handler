## API Exception Handler is an advance error handler for http request.

## Getting started

### Add dependency
````
dependencies:
  api_exception_handler: ^0.0.3
````

## Super simple to use 

```dart
Future fetchData() async {
  String url = 'https://api.covid19api.com/summary';

  var response = await BaseClient().get(url: url);
  var data = json.decode(response);

  return data;
}
```

````
APIResponseHandler(
        function: [fetchData()],
        successScreen: (data) {
          return Text(data!.data[0].toString());
        },
        errorScreen: (data) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.toString()),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    /// simply call setState(() {}) to refresh the data.
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: const Text('Retry', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          );
        },
        networkErrorScreen: const Text('Cannot establish connection with server!!'),
        loadingScreen: const Center(
          child: CupertinoActivityIndicator(radius: 20,),
        ),
      )
````

### Or simply use FutureBuilder

````
FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          /// <<--->> ///
        } else if(snapshot.hasError) {
          /// <<--->> ///
        } else if(snapshot.connectionState == ConnectionState.waiting) {
          /// <<--->> ///
        } else if(snapshot.connectionState == ConnectionState.none) {
          /// <<--->> ///
        }
        return const Center(child: CupertinoActivityIndicator(radius: 18,),);
      },
    )
````