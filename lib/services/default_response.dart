class DefaultResponse<T>{
  final T? data;
  final String message;
  final bool status;

  DefaultResponse({this.data, required this.message, required this.status});

  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return DefaultResponse(
      data: json['data'],
      message: json['message'],
      status: json['status'],
    );
  }
}