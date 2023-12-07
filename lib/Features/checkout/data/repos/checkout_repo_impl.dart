import 'package:dartz/dartz.dart';
import 'package:payment_app/Core/errors/failures.dart';
import 'package:payment_app/Core/stripe_service.dart';
import 'package:payment_app/Features/checkout/data/models/payment_model/payment_input_model.dart';
import 'package:payment_app/Features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>>makePayment(
      {required PaymentInputModel paymentInputModel}) async {
    try {
      await stripeService.makePayment(paymentInputModel: paymentInputModel,);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
