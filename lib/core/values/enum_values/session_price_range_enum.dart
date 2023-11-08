enum PriceRangeEnum { under_2500, from_2500_to_5000, more_than_5000 }

extension EnumUIName on PriceRangeEnum {
  String uiName() {
    switch (this) {
      case PriceRangeEnum.under_2500:
        return 'До 2500';
      case PriceRangeEnum.from_2500_to_5000:
        return 'От 2500 до 5000';
      case PriceRangeEnum.more_than_5000:
        return 'Более 5000';
    }
  }
}