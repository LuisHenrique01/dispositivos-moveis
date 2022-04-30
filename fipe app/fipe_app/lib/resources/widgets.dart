import 'package:flutter/material.dart';

Card imageCard(String imageName, String cardText, Function()? onTap) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage('assets/img/$imageName.jpg'),
          child: InkWell(
            onTap: onTap,
          ),
          height: 185,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Text(
            cardText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        )
      ],
    ),
  );
}

Card simpleCard(String key, String leading, String title, Function()? onTap) {
  return Card(
    key: ValueKey(key),
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      leading: Text(leading.toUpperCase()),
      title: Text(title.toUpperCase()),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    ),
  );
}
