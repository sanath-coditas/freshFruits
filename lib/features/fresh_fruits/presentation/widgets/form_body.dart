import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/custom_textfield.dart';
import '../../../../constants/text_styles.dart';

class FormBody extends StatelessWidget {
  const FormBody({
    Key? key,
  }) : super(key: key);

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
              TextConstants.fullnameText,
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
              TextConstants.emailAddress,
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
            child: Text(
              TextConstants.phoneText,
              style: TextStyles.formItemStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextField(
              labelText: '+880 1617202070',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              TextConstants.addressText,
              style: TextStyles.formItemStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextField(
              labelText: 'Type your home address',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  TextConstants.zipCodeText,
                  style: TextStyles.formItemStyle,
                )),
                Expanded(
                    child: Text(
                  TextConstants.cityText,
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
