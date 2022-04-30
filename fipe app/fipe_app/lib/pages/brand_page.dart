import 'package:fipe_app/models/brand.dart';
import 'package:fipe_app/resources/widgets.dart';
import 'package:fipe_app/services/requests.dart';
import 'package:flutter/material.dart';

class BrandPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const BrandPage({Key? key, required this.data}) : super(key: key);

  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  late List<Brand> allBrands = [];
  late List<Brand> _brands;
  late Future<List<Brand>> futureBrands;

  @override
  void initState() {
    super.initState();
    futureBrands = Fetch().getBrands(widget.data['type']);
  }

  setAllBrands(allBrands) {
    allBrands.addAll(allBrands);
  }

  setBrands(brands) {
    _brands = brands;
    _brands.sort(((a, b) => a.name.toString().compareTo(b.name.toString())));
    if (allBrands.isEmpty) {
      setAllBrands(brands);
    }
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
                }
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: _brands.length,
                        itemBuilder: (context, index) {
                          return simpleCard(
                              _brands[index].code.toString(),
                              (index + 1).toString(),
                              _brands[index].name.toString());
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
