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
        body: FutureBuilder(
      future: futureInfos,
      builder: (context, snapshot) {
        var data = snapshot.data as Info;
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    const Text('Preço:',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('${data.price}')
                  ],
                ))
              ],
            )
          ],
        );
      },
    ));
  }
}
