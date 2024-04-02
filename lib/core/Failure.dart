abstract class Failure
{
  const Failure({required this.ErrorCode, required this.ErrorMessage});

  final String ErrorCode;
  final String ErrorMessage;
}

class APIFailure extends Failure
{
  APIFailure({required super.ErrorCode, required super.ErrorMessage});
}