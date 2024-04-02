import 'package:VetLink/core/Typedefs.dart';

abstract class UseCaseWithParams<ReturnType, ParamsType> 
{
  const UseCaseWithParams();

  FailureOr<ReturnType> call(ParamsType params);
}

abstract class UseCaseWithoutParams<ReturnType> 
{
  const UseCaseWithoutParams();

  FailureOr<ReturnType> call();
}
