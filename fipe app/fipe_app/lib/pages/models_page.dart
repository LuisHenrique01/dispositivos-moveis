import 'package:fipe_app/models/model.dart';
import 'package:fipe_app/resources/widgets.dart';
import 'package:fipe_app/services/requests.dart';
import 'package:flutter/material.dart';

class ModelsPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const ModelsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  late List<Model> _models;
  late List<Model> allModels = [];
  final ScrollController _scrollController = ScrollController();
  int limit = 6;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetch();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        fetch();
      }
    });
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      allModels.clear();
      _models.clear();
    });

    fetch();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  setAllModels(values) {
    allModels.addAll(values);
  }

  setModels(models) {
    _models = models;
    _models.sort(((a, b) => a.name.toString().compareTo(b.name.toString())));
  }

  void _runFilter(String enteredKeyword) {
    List<Model> results = allModels;
    if (enteredKeyword.isNotEmpty) {
      results = allModels
          .where((model) => model.name
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _models.clear();
      _models.addAll(results);
    });
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    if (allModels.isEmpty) {
      allModels = await Fetch()
          .getModels(widget.data['type'], widget.data['brand_code']);
    }
    int lengthActual = _models.length;
    setState(() {
      isLoading = false;
      if (allModels.length - lengthActual < limit) {
        hasMore = false;
      }
      _models.addAll(allModels.sublist(lengthActual, lengthActual + limit));
    });
  }

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
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Model>>(
                future: futureModels,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    setModels(snapshot.data);
                    if (allModels.isEmpty) {
                      setAllModels(snapshot.data);
                    }
                  }
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: _models.length,
                          itemBuilder: (context, index) {
                            return simpleCard(
                                _models[index].code.toString(),
                                (index + 1).toString(),
                                _models[index].name.toString(),
                                () => {});
                          })
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
