class RedirectModel {
  bool fromSuperApp;
  String? flavor;
  String? apiData;

  RedirectModel({
    required this.fromSuperApp,
    this.flavor,
    this.apiData,
  });

  factory RedirectModel.fromJson(Map<String, dynamic> json) => RedirectModel(
        fromSuperApp: json["fromSuperApp"],
        flavor: json["flavor"],
        apiData: json["apiData"],
      );

  Map<String, dynamic> toJson() => {
        "fromSuperApp": fromSuperApp,
        "flavor": flavor,
        "apiData": apiData,
      };
}
