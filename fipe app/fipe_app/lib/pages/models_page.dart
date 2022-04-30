import 'package:flutter/material.dart';

class ModelsPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const ModelsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.data['brand_name'].toString().toUpperCase())),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => {},
              decoration: const InputDecoration(
                  labelText: 'Buscar modelo', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
