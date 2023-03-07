part of 'login_screen.dart';

extension LoginExtension on LoginScreen {
  Widget loginBody(BuildContext context) {
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
              'Sign in',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Obx(
              () => TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter your registered phone here",
                  labelText: 'Phone number',
                  prefixText: '+84 | ',
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                  errorText: controller.errorText.value,
                ),
              ),
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
            Obx(
              () => MaterialButton(
                onPressed: controller.isEnabled.value
                    ? () {
                        controller.onSignInClicked(onError: (error) {
                          var snackBar = SnackBar(content: Text(error));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    : null,
                minWidth: MediaQuery.of(context).size.width,
                disabledColor: Colors.grey.withOpacity(0.5),
                color: Colors.blue,
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            InkWell(
              onTap: () {
                controller.onSignUpAccountClicked();
              },
              child: const Center(
                child: Text(
                  'Sign up new account',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget buildFooter() {
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
