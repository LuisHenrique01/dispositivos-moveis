import 'package:albuns/models/user.dart';
import 'package:flutter/material.dart';
import 'package:albuns/requests/api.dart';
import 'package:albuns/models/album.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Album>> futureAlbum;
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureAlbum = Fetch().getListAlbuns();
  }

  void setUser(int id) {
    futureUser = Fetch().getUser(id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lime[300],
      body: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              var data = snapshot.data;
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Card(
                      child: InkWell(
                    onTap: () {
                      _showMyDialog(data![index].id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlue[700],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  '${data?[index].id}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data?[index].title}'.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
              );
            },
          )),
    ));
  }

  Future<void> _showMyDialog(int id) async {
    setUser(id);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Criador',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
              child: FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListBody(
                children: <Widget>[
                  Text('Nome: ${data?.name}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  Text('Email: ${data?.email}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ],
              );
            },
          )),
          actions: <Widget>[
            TextButton(
                child: const Text('Voltar'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
