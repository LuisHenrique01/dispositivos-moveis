import 'package:fipe_app/models/info.dart';
import 'package:fipe_app/services/requests.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const InfoPage({Key? key, required this.data}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late Future<Info> futureInfos;

  @override
  void initState() {
    super.initState();
    futureInfos = Fetch().getInfos(
        widget.data['type'],
        widget.data['brand_code'],
        widget.data['model_code'],
        widget.data['year_code']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Descrição')),
        body: FutureBuilder(
          future: futureInfos,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data as Info;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    miniColumn('Fabricante:', data.brand.toString()),
                    miniColumn('Modelo:', data.model.toString()),
                  ],
                ),
                const SizedBox(height: 15),
                miniColumn("Preço:", data.price.toString()),
                miniColumn('Ano do modelo:', data.modelYear.toString()),
                miniColumn('Combustível:', data.fuel.toString()),
                miniColumn('FIPE Código:', data.codeFipe.toString()),
                miniColumn(
                    'Mês de referência FIPE:', data.referenceMonth.toString())
              ],
            );
          },
        ));
  }

  Widget miniColumn(String title, String value) {
    return Expanded(
        child: Column(
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 5,
        ),
        Text(value, style: const TextStyle(fontSize: 20.0)),
      ],
    ));
  }
}
