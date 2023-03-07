part of 'auth_screen.dart';

extension AuthExtension on AuthScreen {
  Widget buildCardNote() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.help_outline, color: Colors.blue),
          minLeadingWidth: 0.0,
          horizontalTitleGap: 8.0,
          title: Text(
            'Verify Personal Information',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Please provide the following information to complete the store registration process',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormInputPersonalInfo({
    required TextEditingController nameController,
    required TextEditingController nationalityController,
    required Function() onFrontUpload,
    required Function() onBacksideUpload,
    required Function() onContinue,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8.0),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Restaurant owner name',
            hintText: 'Enter name',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: nationalityController,
          decoration: const InputDecoration(
            labelText: 'Nationality',
            hintText: 'Enter your nationality in here',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12.0),
        Obx(
          () => controller.frontImagePath.value != null
              ? Image.file(File(controller.frontImagePath.value!))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Front of '.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const [
                            TextSpan(
                              text: '(Optional)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: onFrontUpload,
                      child: SizedBox(
                        width: (Get.width - 8 * 2),
                        height: 180.0,
                        child: DottedBorder(
                          dashPattern: const [8, 4],
                          strokeWidth: 1.0,
                          padding: const EdgeInsets.all(24),
                          borderPadding: const EdgeInsets.all(4),
                          child: Center(
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
                                  'CCCD/CMND/Passport',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 24.0),
        Obx(
          () => controller.backsideImagePath.value != null
              ? Image.file(File(controller.backsideImagePath.value!))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Backside of '.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const [
                            TextSpan(
                              text: '(Optional)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              ),
                            )
                          ]),
                    ),
                    const SizedBox(height: 12.0),
                    InkWell(
                      onTap: onBacksideUpload,
                      child: SizedBox(
                        width: (Get.width - 8 * 2),
                        height: 180.0,
                        child: DottedBorder(
                            dashPattern: const [8, 4],
                            strokeWidth: 1.0,
                            padding: const EdgeInsets.all(24),
                            borderPadding: const EdgeInsets.all(4),
                            child: Center(
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
                                    'CCCD/CMND/Passport',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(height: 24.0),
        MaterialButton(
          onPressed: onContinue,
          minWidth: Get.width,
          color: Colors.blue,
          child: const Text(
            'Continue',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormInputBankAccountInfo({
    required Function() onAddMethod,
    required TextEditingController nameController,
    required TextEditingController numberAccountController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Account bank name",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Enter name',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
        const SizedBox(height: 12.0),
        const Text(
          "Account number",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: numberAccountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter account number',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
        MaterialButton(
          onPressed: onAddMethod,
          color: Colors.blue,
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantInfoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Restaurant name",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller.nameResController,
          decoration: const InputDecoration(
            hintText: 'Enter name',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
        const SizedBox(height: 12.0),
        const Text(
          "Service type",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller.serviceTypeController,
          decoration: const InputDecoration(
            hintText: 'Enter type',
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          ),
        ),
        const SizedBox(height: 12.0),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            "Choose address",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            "This is default address your merchant, you are change or add it in settings.",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          trailing: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            child: const Text(
              "Select",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        // const TextField(
        //   decoration: InputDecoration(
        //     hintText: 'Enter address',
        //     contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        //     border:
        //         OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        //   ),
        // ),
      ],
    );
  }

  Widget buildBaseInputInfo({
    required String title,
    required Widget formInput,
    Widget? checkStatus,
    required ExpandableController controller,
    required IconData icon,
  }) {
    return ExpandablePanel(
      controller: controller,
      header: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 32,
          ),
          const SizedBox(width: 8.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      collapsed: checkStatus ??
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: const Color(0xFFffecb3)),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: const Text(
              'Undefined',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.orange,
              ),
            ),
          ),
      expanded: formInput,
    );
  }

  Widget _buildConfirm() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        Text(
          'Confirmed',
          style: TextStyle(
            color: Colors.green,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
