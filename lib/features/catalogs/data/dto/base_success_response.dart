class BaseSuccessResponse {
  dynamic id;
  String info;

  BaseSuccessResponse({required this.id, required this.info});

  factory BaseSuccessResponse.fromJson(Map<String, dynamic> json) =>
      BaseSuccessResponse(
        id: json['id'],
        info: json['info'],
      );
}
