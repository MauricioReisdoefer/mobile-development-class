class Origin {
  Origin({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Origin.fromJson(Map<String, dynamic> json) =>
      Origin(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}