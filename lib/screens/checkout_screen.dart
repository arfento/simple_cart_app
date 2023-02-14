import 'package:flutter/material.dart';
import 'package:simple_cart_app/widgets/custom_app_bar.dart';
import 'package:simple_cart_app/widgets/order_summary.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String routeName = '/checkout';

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController ziCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text = "";
    nameController.text = "";
    addressController.text = "";
    cityController.text = "";
    countryController.text = "";
    ziCodeController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: "Checkout"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "CUSTOMER INFORMATION",
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(context, "Email", emailController),
            _buildTextFormField(context, "Full Name", nameController),
            Text(
              "DELIVERY INFORMATION",
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildTextFormField(context, "Address", addressController),
            _buildTextFormField(context, "City", cityController),
            _buildTextFormField(context, "Country", countryController),
            _buildTextFormField(context, "Zip Code", ziCodeController),
            Text(
              "ORDDER SUMMARY",
              style: Theme.of(context).textTheme.headline3,
            ),
            const OrderSummary(),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Center(
                    child: Text(
                      "SELECT A PAYMENT METHOD",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(),
                elevation: 0,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "ORDER NOW",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTextFormField(
      BuildContext context, String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 75,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ))
        ],
      ),
    );
  }
}
