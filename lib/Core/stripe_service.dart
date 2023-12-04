import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/Core/api_keys.dart';
import 'package:payment_app/Core/api_service.dart';
import 'package:payment_app/Features/checkout/data/models/payment_model/payment_input_model.dart';
import 'package:payment_app/Features/checkout/data/models/payment_model/payment_model.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentModel> createPaymentIntent(
      PaymentInputModel paymentInputModel) async {
    var data = await apiService.post(
        body: paymentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: Apikeys.SecretKey);

    var paymentModel = PaymentModel.fromJson(data.data);
    return paymentModel;
  }

  Future initPaymentSheet({required String setupIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      setupIntentClientSecret: setupIntentClientSecret,
      merchantDisplayName: "hammam",
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentInputModel paymentInputModel}) async {
    var paymentModel = await createPaymentIntent(paymentInputModel);
    await initPaymentSheet(setupIntentClientSecret: paymentModel.clientSecret!);
    await displayPaymentSheet();
  }
} 
