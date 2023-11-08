
import 'package:flutter/cupertino.dart';
import 'package:flutter_spiks_test/core/values/enum_values/session_price_range_enum.dart';
import 'package:flutter_spiks_test/data/repositories/models/filter_model/filter.dart';

class FiltersViewModel extends ChangeNotifier {
  String minAgeValue = '18';
  String maxAgeValue = '70';
  PriceRangeEnum currentPrice = PriceRangeEnum.under_2500;

  void updateMinAgeValue(String value) {
    final intValue = int.parse(value);
    final maxAgeValueInt = int.parse(maxAgeValue);
    if(intValue>=18 && intValue<=maxAgeValueInt) {
      minAgeValue = value;
      notifyListeners();
    }
  }

  void updateMaxAgeValue(String value) {
    final intValue = int.parse(value);
    final minAgeValueInt = int.parse(minAgeValue);
    if(intValue<=70 && intValue>=minAgeValueInt) {
      maxAgeValue = value;
      notifyListeners();
    }
  }

  void updateCurrentPrice(PriceRangeEnum value) {
    currentPrice = value;
    notifyListeners();
  }

  FilterSettings getFilters() {
    final intMinAgeValue = int.tryParse(minAgeValue) ?? FilterSettings().minAgeValue;
    final intMaxAgeValue = int.tryParse(maxAgeValue) ?? FilterSettings().maxAgeValue;

    int minPrice = FilterSettings().minPrice;
    int maxPrice = FilterSettings().maxPrice;

    switch (currentPrice) {
      case PriceRangeEnum.under_2500:
        minPrice = 0;
        maxPrice = 2500;
        break;
      case PriceRangeEnum.from_2500_to_5000:
        minPrice = 2500;
        maxPrice = 5000;
        break;
      case PriceRangeEnum.more_than_5000:
        minPrice = 5000;
        maxPrice = 1000000;
        break;
    }
    return FilterSettings(minAgeValue: intMinAgeValue, maxAgeValue: intMaxAgeValue, minPrice: minPrice, maxPrice: maxPrice);
  }

  void resetToDefault() {
    currentPrice = PriceRangeEnum.under_2500;
    minAgeValue = '18';
    maxAgeValue = '70';
    notifyListeners();
  }



}
