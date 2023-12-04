class PaymentInputModel {
  final String amount;
  final String currency;

  PaymentInputModel({required this.amount, required this.currency});

  toJson() {
    return {
      "amount":amount,
      "currency":currency,
    };
  }
}
