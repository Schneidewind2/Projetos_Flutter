
class PersonagensGot {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;


  PersonagensGot(
    {
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.title,
      required this.family,
      required this.image,
      required this.imageUrl,
    }
  );

  factory PersonagensGot.fromJson(Map<String, dynamic> json) => PersonagensGot(
    id: json['id'], 
    firstName: json['firstName'], 
    lastName: json['lastName'], 
    fullName: json['fullName'], 
    title: json['title'], 
    family: json['family'], 
    image: json['image'], 
    imageUrl: json['imageUrl'],
    );
}