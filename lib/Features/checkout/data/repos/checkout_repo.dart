import 'package:dartz/dartz.dart';
import 'package:payment_app/Core/errors/failures.dart';


import 'package:payment_app/Features/checkout/data/models/payment_model/payment_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentInputModel paymentInputModel,});
}
