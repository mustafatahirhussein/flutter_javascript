import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

class TutorialSpot extends StatefulWidget {
  const TutorialSpot({Key? key}) : super(key: key);

  @override
  State<TutorialSpot> createState() => _TutorialSpotState();
}

class _TutorialSpotState extends State<TutorialSpot> {
  int counter = 0;
  JavascriptRuntime runtime = getJavascriptRuntime();

  dynamic path = rootBundle.loadString("assets/file.js");

  @override
  Widget build(BuildContext context) {
    Color c = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Tutorial Spot - JS / Flutter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final result = await additionFn(runtime, counter, 1);

                    setState(() {
                      counter = result as int;
                    });
                  },
                  child: Text("Add")),


              ElevatedButton(
                  onPressed: () async {
                    final result = await substractionFn(runtime, counter, 1);

                    setState(() {
                      counter = result as int;
                    });
                  },
                  child: Text("Sub")),

              ElevatedButton(
                  onPressed: () async {
                    final result = await multiplicationFn(runtime, counter, 2);

                    setState(() {
                      counter = result as int;
                    });
                  },
                  child: Text("Mul")),

              ElevatedButton(
                  onPressed: () async {
                    final result = await divisionFn(runtime, counter, 3);

                    setState(() {
                      counter = result as int;
                    });
                  },
                  child: Text("Div")),
            ],
          ),
        ));
  }

  dynamic additionFn(JavascriptRuntime runtime, int v1, int v2) async {
    final jsFile = await path;

    JsEvalResult jsEvalResult =
    runtime.evaluate("""${jsFile}addition($v1, $v2)""");

    return int.parse(jsEvalResult.stringResult);
  }

  dynamic substractionFn(JavascriptRuntime runtime, int v1, int v2) async {
    final jsFile = await path;

    JsEvalResult jsEvalResult =
    runtime.evaluate("""${jsFile}subtraction($v1, $v2)""");

    return int.parse(jsEvalResult.stringResult);
  }

  dynamic multiplicationFn(JavascriptRuntime runtime, int v1, int v2) async {
    final jsFile = await path;

    JsEvalResult jsEvalResult =
    runtime.evaluate("""${jsFile}multiplication($v1, $v2)""");

    return int.parse(jsEvalResult.stringResult);
  }

  dynamic divisionFn(JavascriptRuntime runtime, int v1, int v2) async {
    final jsFile = await path;

    JsEvalResult jsEvalResult =
    runtime.evaluate("""${jsFile}division($v1, $v2)""");

    return int.parse(jsEvalResult.stringResult);
  }
}