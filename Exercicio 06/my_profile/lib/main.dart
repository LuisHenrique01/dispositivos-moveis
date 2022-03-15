import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyProfile());
}

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('Meu perfil', textAlign: TextAlign.center),
      ),
      backgroundColor: Colors.cyan[200],
      body: Center(
        child: Column(children: <Widget>[
          Container(
            width: 100,
            height: 120,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/pp.jpeg'))),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              'Luis Henrique Bueno',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PressStart2P',
                  fontSize: 16),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(15),
              child: const Text(
                'Sou um desenvolvedor back-end com conhecimentos solidos em Python e alguns de seus Frameworks, também tenho conhecimento em JavaScript e agora estou iniciando uma jornada em Flutter.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              'Contatos',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Flexible(
              child: ElevatedButton.icon(
                  onPressed: abrirWhatsapp,
                  icon: const Icon(Icons.whatsapp, size: 22),
                  label: const Text('Whatsapp'),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 65, right: 65)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 18))))),
          Flexible(
              child: ElevatedButton.icon(
                  onPressed: abrirInstagram,
                  icon: const Icon(Icons.camera_alt_outlined, size: 22),
                  label: const Text('Instagram'),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 65, right: 65)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 18))))),
          Flexible(
              child: ElevatedButton.icon(
                  onPressed: fazerLigacao,
                  icon: const Icon(Icons.phone, size: 22),
                  label: const Text('Chamar'),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 74, right: 74)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 18))))),
          Flexible(
              child: ElevatedButton.icon(
                  onPressed: enviarEmail,
                  icon: const Icon(Icons.email_outlined, size: 22),
                  label: const Text('Email'),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 84, right: 84)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 18)))))
        ]),
      ),
    );
  }
}

abrirWhatsapp() async {
  var url = 'whatsapp://send?phone=5589994619853&text=Olá,tudo bem?';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível iniciar $url';
  }
}

abrirInstagram() async {
  var appUrl = 'instagram://user?username=luis_h_bueno.py';
  var webUrl = 'https://www.instagram.com/luis_h_bueno.py/';
  if (await canLaunch(appUrl)) {
    await launch(appUrl);
  } else if (await canLaunch(webUrl)) {
    await launch(webUrl);
  } else {
    throw 'Não foi possível iniciar $webUrl';
  }
}

fazerLigacao() async {
  var url = 'tel:89994619853';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível iniciar $url';
  }
}

enviarEmail() async {
  final Uri params = Uri(
      scheme: 'mailto',
      path: 'luisrocha1201@gmail.com',
      query: 'subject=Vi seu perfil&body=Detalhe aqui o motivo do contato: ');
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível abrir $url';
  }
}
