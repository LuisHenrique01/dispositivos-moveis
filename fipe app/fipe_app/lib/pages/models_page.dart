import 'package:fipe_app/configs/routers.dart';
import 'package:fipe_app/models/arguments.dart';
import 'package:fipe_app/models/model.dart';
import 'package:fipe_app/models/years.dart';
import 'package:fipe_app/services/requests.dart';
import 'package:flutter/material.dart';

class ModelsPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const ModelsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  late List<Model> _models = [];
  late List<Model> allModels = [];
  late List<List<Years>> _years = [];
  final ScrollController _scrollController = ScrollController();
  int _year = 0;
  int limit = 4;
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

  Future fetch() async {
    if (isLoading) return;

    isLoading = true;
    if (allModels.isEmpty) {
      allModels = await Fetch()
          .getModels(widget.data['type'], widget.data['brand_code']);
    }

    int lengthActual = _models.length;
    List<Model> subList;
    List<List<Years>> tempList = [];
    if (allModels.length - lengthActual < limit) {
      subList = allModels.sublist(lengthActual);
    } else {
      subList = allModels.sublist(lengthActual, lengthActual + limit);
    }
    for (var item in subList) {
      List<Years> temp = await Fetch().getYears(
          widget.data['type'], widget.data['brand_code'], item.code.toString());
      tempList.add(temp);
    }
    setState(() {
      if (allModels.length - lengthActual < limit) {
        hasMore = false;
      }
      isLoading = false;
      _years.addAll(tempList);
      _models.addAll(subList);
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
            Expanded(
              child: RefreshIndicator(
                onRefresh: refresh,
                child: _models.isNotEmpty
                    ? ListView.builder(
                        controller: _scrollController,
                        itemCount: _models.length,
                        itemBuilder: (context, index) {
                          if (index < _models.length) {
                            return Card(
                              key: ValueKey((index + 1).toString()),
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading:
                                        Text(_models[index].code.toString()),
                                    title: Text(_models[index].name.toString()),
                                    trailing:
                                        const Icon(Icons.keyboard_arrow_right),
                                    onTap: () => {
                                      Navigator.pushNamed(
                                        context,
                                        Routers.infosPage,
                                        arguments: Arguments({
                                          'type': widget.data['type'],
                                          'brand_code':
                                              widget.data['brand_code'],
                                          'model_code': _models[index].code,
                                          'year_code': _years[index][_year].code
                                        }),
                                      )
                                    },
                                  ),
                                  Wrap(
                                    spacing: 8.0,
                                    runSpacing: 4.0,
                                    children: List<Widget>.generate(
                                      _years[index].length,
                                      (int yearIndex) {
                                        return ChoiceChip(
                                          label: Text(_years[index][yearIndex]
                                              .name
                                              .toString()),
                                          selected: _year == yearIndex,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _year = selected ? yearIndex : 0;
                                            });
                                          },
                                        );
                                      },
                                    ).toList(),
                                  )
                                ],
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: hasMore
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const Center(
                                    child: Text(
                                    'Não possui mais modelos.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                          );
                        },
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
