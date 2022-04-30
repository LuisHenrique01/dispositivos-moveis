import 'package:fipe_app/configs/routers.dart';
import 'package:fipe_app/models/arguments.dart';
import 'package:fipe_app/models/brand.dart';
import 'package:fipe_app/resources/widgets.dart';
import 'package:fipe_app/services/requests.dart';
import 'package:flutter/material.dart';

class BrandsPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const BrandsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  late List<Brand> allBrands = [];
  late List<Brand> _brands;
  late Future<List<Brand>> futureBrands;

  @override
  void initState() {
    super.initState();
    futureBrands = Fetch().getBrands(widget.data['type']);
  }

  setAllBrands(values) {
    allBrands.addAll(values);
  }

  setBrands(brands) {
    _brands = brands;
    _brands.sort(((a, b) => a.name.toString().compareTo(b.name.toString())));
  }

  void _runFilter(String enteredKeyword) {
    List<Brand> results = allBrands;
    if (enteredKeyword.isNotEmpty) {
      results = allBrands
          .where((brand) => brand.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _brands.clear();
      _brands.addAll(results);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data['title'])),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _runFilter(value),
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
                  if (allBrands.isEmpty) {
                    setAllBrands(snapshot.data);
                  }
                }
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: _brands.length,
                        itemBuilder: (context, index) {
                          return simpleCard(
                              _brands[index].code.toString(),
                              (index + 1).toString(),
                              _brands[index].name.toString(),
                              () => {
                                    Navigator.pushNamed(
                                      context,
                                      Routers.modelsPage,
                                      arguments: Arguments({
                                        'type': widget.data['type'],
                                        'brand_name': _brands[index].name,
                                        'brand_code': _brands[index].code
                                      }),
                                    )
                                  });
                        })
                    : const Center(child: CircularProgressIndicator());
              },
            ))
          ],
        ),
      ),
    );
  }
}
