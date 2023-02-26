// ignore_for_file: public_member_api_docs, sort_constructors_first
part of './base_card.dart';

enum CardType {
  visa,
}

class VDCardMediumConfigs {
  final CardType type;
  final String category;
  final String currency;
  final String balance;
  final String fullNumber;
  final String hidenNumber;

  final List<Color> gradientColor;
  VDCardMediumConfigs({
    this.type = CardType.visa,
    required this.category,
    required this.currency,
    required this.balance,
    required this.fullNumber,
    required this.hidenNumber,
    required this.gradientColor,
  });
}

class VDCardSmallConfigs {
  final Widget icon;
  final Color color;
  final String title;
  VDCardSmallConfigs({
    required this.icon,
    required this.color,
    required this.title,
  });
}

class VDCardBigConfigs {
  VDCardBigConfigs();
}
