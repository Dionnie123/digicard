import 'package:digicard/app/models/digital_card.dart';
import 'package:flutter/material.dart';

class CardPreview extends StatelessWidget {
  final DigitalCard? card;
  const CardPreview({super.key, this.card});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: 440,
        child: Card(
          child: Column(
            children: [/* Text(card.toString()) */],
          ),
        ),
      ),
    );
  }
}
