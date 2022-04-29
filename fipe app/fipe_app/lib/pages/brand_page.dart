import 'package:fipe_app/models/brand.dart';
import 'package:fipe_app/services/requests.dart';
import 'package:flutter/material.dart';

class BrandPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const BrandPage({Key? key, required this.data}) : super(key: key);

  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  late List<Brand> _brands;

  setBrands(brands) {
    setState(() {
      _brands = brands;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Brand>> futureBrands = Fetch().getBrands(widget.data['type']);
    return Scaffold(
      appBar: AppBar(title: Text(widget.data['title'])),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => {},
              decoration: const InputDecoration(
                  labelText: 'Buscar', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: FutureBuilder<List<Brand>>(
              future: futureBrands,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  setBrands(snapshot.data);
                }
                return ListView.builder(itemBuilder: (context, index) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Buscando...'));
                  }
                  return Card(
                    key: ValueKey(_brands[index].code),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(_brands[index].code.toString()),
                      title: Text(_brands[index].name.toString()),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () => {},
                    ),
                  );
                });
              },
            ))
          ],
        ),
      ),
    );
  }
}
