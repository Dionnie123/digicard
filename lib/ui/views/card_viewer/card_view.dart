import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/ui/widgets/card_display/card_display.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final DigitalCardDTO card;
  const CardView({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
              child: CardDisplay(
            card,
            allowDownloadQRCode: true,
            allowDownloadVCF: true,
          )));
    });
  }
}
