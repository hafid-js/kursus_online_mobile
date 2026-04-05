import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/features/course/data/services/order_service.dart';
import 'package:kursus_online_mobile/features/enrolled_course/screens/enrolled_course_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/user_model.dart';

class MidtransWebViewPage extends StatefulWidget {
  final String snapToken;
  final UserModel user;
  final CourseDetailModel course;

  const MidtransWebViewPage({
    super.key,
    required this.snapToken,
    required this.user,
    required this.course,
  });

  @override
  State<MidtransWebViewPage> createState() => _MidtransWebViewPageState();
}

class _MidtransWebViewPageState extends State<MidtransWebViewPage> {
  late final WebViewController controller;
  bool isLoading = true; // untuk menampilkan loader

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (_) {
            setState(() {
              isLoading = false;
            });
          },

          // Inside your WebView widget
          // NavigationDelegate(
          //   onNavigationRequest: (NavigationRequest request) {
          //     if (request.url.contains("your-callback-url-scheme")) {
          //       // 1. Close webview
          //       Navigator.pop(context);
          //       // 2. Handle successful/pending payment in Flutter
          //       return NavigationDecision.prevent;
          //     }
          //     return NavigationDecision.navigate;
          //   },
          // )
          onNavigationRequest: (request) async {
            final uri = Uri.parse(request.url);
            print(uri);
            final status = uri.queryParameters['transaction_status'];
            final orderId = uri.queryParameters['order_id'];

            if (status != null && orderId != null) {
              if (status == 'capture') {
                if (uri.toString().startsWith(
                  "https://hafidtech.com/kursus-online/payment-success",
                )) {
                  await _handlePaymentSuccess(
                    orderId,
                    widget.course.price.toDouble(),
                  );
                  if (!mounted) return NavigationDecision.prevent;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => EnrolledCourseScreen()),
                  );
                }

                return NavigationDecision.prevent;
              } else if (status == 'pending') {
                if (mounted) Navigator.pop(context, "pending");
                return NavigationDecision.prevent;
              } else if (status == 'deny') {
                if (mounted) Navigator.pop(context, "failed");
                return NavigationDecision.prevent;
              }
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://app.sandbox.midtrans.com/snap/v2/vtweb/${widget.snapToken}",
        ),
      );
  }

  Future<void> _handlePaymentSuccess(String orderId, double totalPrice) async {
    final result = await OrderService.storeAfterPayment(
      transactionId: orderId,
      mainAmount: totalPrice,
      paidAmount: totalPrice,
      currency: "IDR",
    );

    if (!result && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Order Save Failed!")));
      Navigator.pop(context, "failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: WebViewWidget(controller: controller),
    );
  }
}
