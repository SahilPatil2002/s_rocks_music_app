class Service {
  final String title;
  final String description;
  final String icon;
  final String image;

  Service({
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });

  factory Service.fromMap(Map<String, dynamic> data) {
    return Service(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
