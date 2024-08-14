import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/helpers/regex_validator.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({super.key});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = Country(
      name: 'Syria',
      phoneCode: '963',
      countryCode: 'SY',
      e164Sc: 0,
      displayNameNoCountryCode: 'Syria',
      e164Key: '',
      geographic: true,
      level: 1,
      example: '+963 996 697 253',
      displayName: 'Syria (+963)',
    );
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryTextField(
      labelText: 'Phone Number',
      inputType: TextInputType.phone,
      validator: (value) => RegexValidator.validatePhone(value),
      labelIcon: SvgPicture.asset(AppAssets.phone),
      prefixIcon: InkWell(
        onTap: () {
          showCountryPicker(
            context: context,
            showPhoneCode: true,
            onSelect: (Country country) {
              setState(() {
                _selectedCountry = country;
                // widget.onCountrySelected?.call(_selectedCountry?.phoneCode);
              });
            },
          );
        },
        borderRadius: BorderRadius.circular(35.r),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _selectedCountry?.flagEmoji ?? '',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              Text('  +${_selectedCountry?.phoneCode ?? '963'} '),
            ],
          ),
        ),
      ),
    );
  }
}
