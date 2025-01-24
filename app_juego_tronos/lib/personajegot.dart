class Personajegot {
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String died;
  


  const Personajegot({required this.name, required this.gender, required this.culture, required this.born, required this.died});

  factory Personajegot.fromJson(Map<String, dynamic> json){
    return Personajegot(
      name: json['name'] as String,
      gender: json['gender'] as String,
      culture: json['culture'] as String, 
      born: json['born'] as String, 
      died: json['died'] as String);
  }
}