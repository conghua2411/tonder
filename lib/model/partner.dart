import 'dart:math';

class Partner {
  String? id;
  String? name;
  int? age;
  int? gender;
  int? status;
  String? image;

  Partner({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.status,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'status': status,
      'image': image,
    };
  }

  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      status: json['status'],
      image: json['image'],
    );
  }

  static List<Partner> genListSamplePartner() {
    Random rand = Random();
    return List.generate(
      10,
      (index) => Partner(
        id: '$index',
        name: 'Name $index',
        age: rand.nextInt(20) + 20,
        gender: rand.nextInt(3),
        status: rand.nextInt(3),
        image: 'https://picsum.photos/id/${300 + rand.nextInt(200)}/200/300',
      ),
    );
  }
}
