import 'dart:convert';

class Pokemon {
  final String name;
  final String image;
  final int id;
  final String num;

  //O json retorna uma lista dentro de outra lista, e podemos pega-la dessa forma (no json é a lista 'type')
  final List<String> type;

  Pokemon({
    this.name = '',
    this.image = '',
    this.id = 0,
    this.num = '',
    this.type = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'id': id,
      'num': num,
      'type': type,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    //aqui os nomes das chaves precisam ser exatamente igual o json (repare no imagem e no img)
    return Pokemon(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      id: json['id']?.toInt() ?? 0,
      num: json['num'] ?? '',
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      // type: List<String>.from(map['type'] ?? const [])
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));
}
