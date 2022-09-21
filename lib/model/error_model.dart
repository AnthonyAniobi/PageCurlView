abstract class ErrorModel {
  Map message;

  ErrorModel(this.message);

  String getMessage();

  String getCode();
}

class RequestError extends ErrorModel {
  RequestError(super.message);

  @override
  String getCode() {
    return message['code'].toString();
  }

  @override
  String getMessage() {
    return message['message'];
  }
}

class NetworkError extends ErrorModel {
  Map message;

  NetworkError(this.message) : super(message);

  @override
  String getCode() {
    return message['code']!;
  }

  @override
  String getMessage() {
    return message['message']!;
  }
}
