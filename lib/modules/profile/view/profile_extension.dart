part of 'profile_screen.dart';

extension ProfileExtension on ProfileScreen {
  Widget buildProfileBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Registration information',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              autofocus: true,
              controller: controller.fullNameController,
              decoration: const InputDecoration(
                  labelText: 'Full name',
                  hintText: 'example: phuc.nguyen@gmail.com',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                  )),
            ),
            const SizedBox(height: 24.0),
            TextField(
              autofocus: true,
              controller: controller.phoneController,
              decoration: const InputDecoration(
                  labelText: 'Phone number',
                  prefixIcon: Icon(Icons.phone),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  hintText: 'Enter phone number here',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                  )),
            ),
            const SizedBox(height: 16.0),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Representative Information',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Please provide the following information in full',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            _buildUploadImage(onFrontUpload: () {
              controller.onUploadFrontImage();
            }, onBacksideUpload: () {
              controller.onUploadBacksideImage();
            }),
            const SizedBox(height: 12),
            _buildInputBankAccountInfo(),
            MaterialButton(
              onPressed: () {},
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Text(
                'confirm'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadImage({
    required Function() onFrontUpload,
    required Function() onBacksideUpload,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Upload front and backside photo',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 12.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Obx(
                () => controller.frontImagePath.value != null
                    ? Image.file(File(controller.frontImagePath.value!))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Front of'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          InkWell(
                            onTap: onFrontUpload,
                            child: SizedBox(
                              width: (Get.width - 8 * 3) / 2,
                              child: DottedBorder(
                                dashPattern: const [8, 4],
                                strokeWidth: 1.0,
                                padding: const EdgeInsets.all(24),
                                borderPadding: const EdgeInsets.all(4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.cloud_upload_outlined,
                                      color: Colors.blue,
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Upload Image',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'CCCD/ID/Passport',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Obx(
                () => controller.backsideImagePath.value != null
                    ? Image.file(File(controller.backsideImagePath.value!))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Backside of'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          InkWell(
                            onTap: onBacksideUpload,
                            child: SizedBox(
                              width: (Get.width - 8 * 3) / 2,
                              child: DottedBorder(
                                  dashPattern: const [8, 4],
                                  strokeWidth: 1.0,
                                  padding: const EdgeInsets.all(24),
                                  borderPadding: const EdgeInsets.all(4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.cloud_upload_outlined,
                                        color: Colors.blue,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Upload Image',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'CCCD/ID/Passport',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        RichText(
            text: const TextSpan(
                text: 'Note*: ',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.red,
                ),
                children: [
              TextSpan(
                text:
                    'Taken directly, no photo, no angle, missing angle, bright',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ])),
      ],
    );
  }

  Widget _buildInputBankAccountInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Bank account information',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
