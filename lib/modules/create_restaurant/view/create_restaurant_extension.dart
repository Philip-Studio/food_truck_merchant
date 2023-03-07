part of 'create_restaurant_screen.dart';

extension CreateRestaurantExtension on CreateRestaurantScreen {
  Widget createRestaurantBody() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: 'Upload image '.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: const [
                    TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                        )),
                  ]),
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12.0),
              const Expanded(
                child: Text(
                  'Please upload maximum 8 images to confirm create your merchant.',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: 'Input information '.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: const [
                    TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red,
                        )),
                  ]),
            ),
          ),
          const SizedBox(height: 12.0),
          _buildInputMerchantInfo(),
        ],
      ),
    );
  }

  Widget _buildInputMerchantInfo() {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Enter name',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12.0),
        ChoiceChip(label: Text('Categories'), selected: false),
      ],
    );
  }
}
