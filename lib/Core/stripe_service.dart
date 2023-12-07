import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/Core/api_keys.dart';
import 'package:payment_app/Core/api_service.dart';
import 'package:payment_app/Features/checkout/data/models/create_customer_model/create_customer_model.dart';
import 'package:payment_app/Features/checkout/data/models/create_customer_model/customer_input_model.dart';
import 'package:payment_app/Features/checkout/data/models/epherimal_key_model/epherimal_key_model.dart';
import 'package:payment_app/Features/checkout/data/models/payment_model/payment_input_model.dart';
import 'package:payment_app/Features/checkout/data/models/payment_model/payment_model.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentModel> createPaymentIntent(
      PaymentInputModel paymentInputModel) async {
    var data = await apiService.post(
        contenttype: Headers.formUrlEncodedContentType,
        body: paymentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: Apikeys.SecretKey);

    var paymentModel = PaymentModel.fromJson(data.data);
    return paymentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret,required String customerId,
  required String customerEphemeralKeySecret }) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      customerId: customerId,
      customerEphemeralKeySecret: customerEphemeralKeySecret,
      merchantDisplayName: "hammam",
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

   Future<CreateCustomerModel> createCustomer(
      CustomerInputModel customerInputModel) async {
    var data = await apiService.post(
        contenttype: Headers.formUrlEncodedContentType,
        body: customerInputModel.toJson(),
        url: "https://api.stripe.com/v1/customers",
        token: Apikeys.SecretKey);

    var createCustomerModel = CreateCustomerModel.fromJson(data.data);
    return createCustomerModel;
  }
   Future<EpherimalKeyModel> createEpherimalKey(
      {required String customerId}) async {
    var data = await apiService.post(
        contenttype: Headers.formUrlEncodedContentType,
        body: {"customer":customerId,},
        headers: {
          "Authorization": "Bearer ${Apikeys.SecretKey}",
          "Stripe-Version":"2023-10-16",
        },
        url: "https://api.stripe.com/v1/ephemeral_keys",
        token: Apikeys.SecretKey);

    var epherimalKeyModel = EpherimalKeyModel.fromJson(data.data);
    return epherimalKeyModel;
  }

  Future makePayment({required PaymentInputModel paymentInputModel,}) async {
    var paymentModel = await createPaymentIntent(paymentInputModel);
     var epherimalKeyModel = await createEpherimalKey(customerId:paymentInputModel.customerId);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentModel.clientSecret!,
        customerId: paymentInputModel.customerId,
        customerEphemeralKeySecret: epherimalKeyModel.secret!,
        );
    await displayPaymentSheet();
  }
}
