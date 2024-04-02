import 'package:auto_mechanic_advisor/feature/information/data/models/information_model.dart';
import 'package:auto_mechanic_advisor/feature/information/presentation/widgets/information_details_view_body.dart';
import 'package:flutter/material.dart';

class InformationDetails extends StatelessWidget {
  const InformationDetails({super.key, required this.informationModel});
  final InformationModel informationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InformationDetailsBody(
        informationModel: informationModel,
      ),
    );
  }
}
