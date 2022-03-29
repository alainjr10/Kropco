import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kropco/models/disease_model.dart';
import 'package:kropco/utils/constants.dart';
import 'package:kropco/widgets/custom_appBar.dart';
import 'package:provider/provider.dart';

import '../components/suggestions_page/text_property.dart';
import '../services/disease_provider.dart';

class Suggestions extends StatelessWidget {
  static const suggestionsScreenId = "/suggestions";
  const Suggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final _diseaseService = Provider.of<DiseaseService>(context);

    Disease _disease = _diseaseService.disease;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(appBarTitle: 'Suggestions', backButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kGeneralBodyPadding),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints.expand(
                    height: size.height * 0.36, width: size.width),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(_disease.imagePath)),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              Divider(
                thickness: (0.0066 * size.height),
                height: (0.013 * size.height),
              ),
              SizedBox(
                height: size.height * 0.5,
                child: ListView(
                  children: [
                    TextProperty(
                      title: 'Disease name',
                      value: _disease.name,
                      height: size.height,
                    ),
                    TextProperty(
                      title: 'Possible causes',
                      value: _disease.possibleCauses,
                      height: size.height,
                    ),
                    TextProperty(
                      title: 'Possible solution',
                      value: _disease.possibleSolution,
                      height: size.height,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
