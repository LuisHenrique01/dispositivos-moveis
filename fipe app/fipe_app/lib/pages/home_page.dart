import 'package:flutter/material.dart';
import 'package:fipe_app/resources/widgets.dart';
import 'package:fipe_app/models/reference.dart';
import 'package:fipe_app/services/requests.dart';
import 'package:fipe_app/configs/app_styles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Reference> futureReference;

  @override
  void initState() {
    super.initState();
    futureReference = Fetch().getReference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FIPE APP"), actions: <Widget>[
        FutureBuilder<Reference>(
            future: futureReference,
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return Center(
                  widthFactor: 1.2,
                  child: Text(
                    '${data?.month}'.toUpperCase(),
                    style: AppStyles.titleStyle,
                  ));
            })
      ]),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          imageCard('carro', 'Carros', () => {}),
          imageCard('moto', 'Motos', () => {}),
          imageCard('caminhao', 'Caminhões', () => {})
        ],
      ),
    );
  }
}
