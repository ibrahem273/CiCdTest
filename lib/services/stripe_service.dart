// abstract class PaymentManager {
//   static Future<void> makePayment(int amount, String currency) async {
//     try {
//       customLoader();
//       String clientSecret =
//           await _getclientSecret((amount * 100).toString(), currency);
//       await _initPaymentSheet(clientSecret);
//       BotToast.closeAllLoading();
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   static Future<void> _initPaymentSheet(String clientSecret) async {
//     await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: clientSecret,
//             merchantDisplayName: "Cllllb"));
//   }

//   static Future<String> _getclientSecret(String amount, String currency) async {
//     Dio dio = Dio();
//     var response = await dio.post('https://api.stripe.com/v1/payment_intents',
//         options: Options(headers: {
//           'Authorization': 'Bearer ${ApiKeys.secretkey}',
//           'Content-Type': 'application/x-www-form-urlencoded'
//            ,'captureMethod': 'manual',
//         }),
//         data: {
//           'amount': amount,
//           'currency': currency,
//         });
//     return response.data["client_secret"];
//   }
// }