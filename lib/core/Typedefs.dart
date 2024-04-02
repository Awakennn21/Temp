import 'package:VetLink/core/Failure.dart';
import 'package:dartz/dartz.dart';

typedef FailureOr<Type> = Future<Either<Failure,Type>>;
typedef FailureOrVoid = Future<Either<Failure,void>>;