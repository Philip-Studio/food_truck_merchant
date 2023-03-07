import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPView extends StatefulWidget {
  final Function(String) onVerify;
  final Function() onError;
  const OTPView({Key? key, required this.onVerify, required this.onError}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.store_mall_directory_outlined,
                    color: Colors.blue,
                    size: 56.0,
                  ),
                  Text(
                    'Food Truck\nMerchant',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Center(child: inputOTPForm(context)),
            buildNeedHelp(),
          ],
        ),
      ),
    );
  }

  Widget inputOTPForm(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12.0),
            const Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Pinput(
              controller: otpController,
              length: 6,
              keyboardType: TextInputType.phone,
              errorText: 'Error',
            ),
            const SizedBox(height: 12.0),
            RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                  text: 'By logging in above, you agree to accept our ',
                  children: [
                    TextSpan(
                        text: 'Terms Services',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(text: ' and '),
                    TextSpan(
                        text: 'Seller Policies.',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  )),
            ),
            const SizedBox(height: 24.0),
            MaterialButton(
              onPressed: (){
                if(otpController.text.isNotEmpty && otpController.text.length == 6) {
                  widget.onVerify(otpController.text);
                } else {
                  widget.onError();
                }
              },
              minWidth: MediaQuery.of(context).size.width,
              disabledColor: Colors.grey.withOpacity(0.5),
              color: Colors.blue,
              child: Text(
                'verify'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget buildNeedHelp() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.help_outline,
            color: Colors.blue,
          ),
          SizedBox(width: 8.0),
          Text(
            'Need help?',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
