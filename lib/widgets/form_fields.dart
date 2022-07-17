import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants.dart';

class PhoneNumberTextformfield extends StatelessWidget {
  const PhoneNumberTextformfield({
    Key? key,
    required this.onChangedFunction,
    required this.formfieldWidth,
    required this.onCodePickerChanged,
  }) : super(key: key);
  final ValueChanged<String> onChangedFunction;
  final ValueChanged<CountryCode> onCodePickerChanged;
  final double formfieldWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 50,
          child: CountryCodePicker(
            onChanged: onCodePickerChanged,
            initialSelection: 'CM',
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            favorite: const ['+237', 'CM'],
            alignLeft: true,
            flagWidth: 22.0,
            padding: const EdgeInsets.all(1),
            textStyle: kH4TextSyle.copyWith(color: Colors.grey),
            dialogTextStyle: kH4TextSyle.copyWith(color: Colors.black87),
          ),
        ),
        SizedBox(
          width: formfieldWidth,
          child: TextFormField(
            style: kH4TextSyle.copyWith(color: Colors.black87),
            decoration: InputDecoration(
              hintText: "e.g 6777777555",
              hintStyle: kH4TextSyle.copyWith(color: Colors.grey),
              border: const UnderlineInputBorder(),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
            ),
            maxLength: 9,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value!.isEmpty) {
                return "This field cannot be empty";
              }
              if (value.length < 9) {
                return "Invalid Phone Number";
              }
              return null;
            },
            onChanged: onChangedFunction,
          ),
        ),
      ],
    );
  }
}

class PasswordTextformfield extends StatelessWidget {
  const PasswordTextformfield({Key? key, required this.onChangedFunction})
      : super(key: key);
  final ValueChanged<String> onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kH4TextSyle.copyWith(color: Colors.black87),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: kH4TextSyle.copyWith(color: Colors.grey),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "This field cannot be empty";
        }
        if (value.length < 8) {
          return "Password must have at least 8 charecters";
        }
        return null;
      },
      onChanged: onChangedFunction,
    );
  }
}

class EmailTextformfield extends StatelessWidget {
  const EmailTextformfield({Key? key, required this.onChangedFunction})
      : super(key: key);
  final ValueChanged<String> onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: kH4TextSyle.copyWith(color: Colors.black87),
        decoration: InputDecoration(
          hintText: "e.g alijames@gmail.com",
          hintStyle: kH4TextSyle.copyWith(color: Colors.grey),
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
        validator: (value) {
          if (value!.length < 3 || !value.contains("@")) {
            return "Invalid Email";
          }
          if (value.isEmpty) {
            return "This field cannot be empty";
          }
          return null;
        },
        onChanged: onChangedFunction);
  }
}

class UsernameTextFormField extends StatelessWidget {
  const UsernameTextFormField({Key? key, required this.onChangedFunction})
      : super(key: key);
  final ValueChanged<String> onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: kH4TextSyle.copyWith(color: Colors.black87),
        decoration: InputDecoration(
          hintText: "e.g Sam Johnson",
          hintStyle: kH4TextSyle.copyWith(color: Colors.grey),
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return "Username must have at least 4 characters";
          }
          if (value.isEmpty) {
            return "This field cannot be empty";
          }
          return null;
        },
        onChanged: onChangedFunction);
  }
}
