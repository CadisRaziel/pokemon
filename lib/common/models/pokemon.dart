// import 'dart:convert';

// class Pokemon {
//   final String name;
//   final String image;
//   final int id;
//   final String num;

//   //O json retorna uma lista dentro de outra lista, e podemos pega-la dessa forma (no json é a lista 'type')
//   final List<String> type;

//   Pokemon({
//     this.name = '',
//     this.image = '',
//     this.id = 0,
//     this.num = '',
//     this.type = const [],
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'image': image,
//       'id': id,
//       'num': num,
//       'type': type,
//     };
//   }

//   factory Pokemon.fromMap(Map<String, dynamic> json) {
//     //aqui os nomes das chaves precisam ser exatamente igual o json (repare no imagem e no img)
//     return Pokemon(
//       name: json['name'] ?? '',
//       image: json['image'] ?? '',
//       id: json['id']?.toInt() ?? 0,
//       num: json['num'] ?? '',
//       type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
//       // type: List<String>.from(map['type'] ?? const [])
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Pokemon.fromJson(String source) =>
//       Pokemon.fromMap(json.decode(source));
// }

import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final List<String> type;
  final int id;
  final String num;
  Pokemon({
    required this.name,
    required this.type,
    required this.id,
    required this.num,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }

  Color? get baseColor => _color(type: type[0]);
  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
