import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        appBarTheme : AppBarTheme(color : Color(0xff0627F7)),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arCoreController){
    this.arCoreController = _arCoreController;
    _addSphere(arCoreController);
  }

  _addSphere(ArCoreController _arCoreController){
    final ArCoreMaterial arCoreMaterial = ArCoreMaterial(color: Color(0xffF706EC));
    final ArCoreSphere arCoreSphere = ArCoreSphere(materials: [arCoreMaterial],radius: 0.2);
    final ArCoreNode arCoreNode = ArCoreNode(shape: arCoreSphere, position: Vector3(0, 0, 1));

    _arCoreController.addArCoreNode(arCoreNode);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,)
    );
  }
}
