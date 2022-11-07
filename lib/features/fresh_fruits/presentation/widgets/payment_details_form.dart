import 'package:flutter/material.dart';

import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';
import 'custom_textfield.dart';

class PaymentDetailsForm extends StatelessWidget {
  const PaymentDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              TextConstants.cardHolderName,
              style: TextStyles.formItemStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextField(
              labelText: 'Rafatul Aslam',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Card number',
              style: TextStyles.formItemStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextField(
              labelText: 'Rafatul123@email.com',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Month/Year',
                  style: TextStyles.formItemStyle,
                )),
                Expanded(
                    child: Text(
                  'CVV',
                  style: TextStyles.formItemStyle,
                )),
              ],
            ),
          ),
          Row(
            children: const [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomTextField(
                  labelText: 'Enter here',
                ),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomTextField(labelText: 'Enter here'),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              TextConstants.countryText,
              style: TextStyles.formItemStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextField(
              labelText: 'Choose your country',
            ),
          ),
        ],
      ),
    );
  }
}
