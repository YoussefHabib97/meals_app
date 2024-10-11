import 'dart:convert';

import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final String? idMeal;
  final String? strMeal;
  final dynamic strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final dynamic strTags;
  final String? strYoutube;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strIngredient16;
  final String? strIngredient17;
  final String? strIngredient18;
  final String? strIngredient19;
  final String? strIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;
  final String? strSource;
  final dynamic strImageSource;
  final dynamic strCreativeCommonsConfirmed;
  final dynamic dateModified;

  const Meal({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory Meal.fromMap(Map<String, dynamic> data) => Meal(
        idMeal: data['idMeal'] as String?,
        strMeal: data['strMeal'] as String?,
        strDrinkAlternate: data['strDrinkAlternate'] as dynamic,
        strCategory: data['strCategory'] as String?,
        strArea: data['strArea'] as String?,
        strInstructions: data['strInstructions'] as String?,
        strMealThumb: data['strMealThumb'] as String?,
        strTags: data['strTags'] as dynamic,
        strYoutube: data['strYoutube'] as String?,
        strIngredient1: data['strIngredient1'] as String?,
        strIngredient2: data['strIngredient2'] as String?,
        strIngredient3: data['strIngredient3'] as String?,
        strIngredient4: data['strIngredient4'] as String?,
        strIngredient5: data['strIngredient5'] as String?,
        strIngredient6: data['strIngredient6'] as String?,
        strIngredient7: data['strIngredient7'] as String?,
        strIngredient8: data['strIngredient8'] as String?,
        strIngredient9: data['strIngredient9'] as String?,
        strIngredient10: data['strIngredient10'] as String?,
        strIngredient11: data['strIngredient11'] as String?,
        strIngredient12: data['strIngredient12'] as String?,
        strIngredient13: data['strIngredient13'] as String?,
        strIngredient14: data['strIngredient14'] as String?,
        strIngredient15: data['strIngredient15'] as String?,
        strIngredient16: data['strIngredient16'] as String?,
        strIngredient17: data['strIngredient17'] as String?,
        strIngredient18: data['strIngredient18'] as String?,
        strIngredient19: data['strIngredient19'] as String?,
        strIngredient20: data['strIngredient20'] as String?,
        strMeasure1: data['strMeasure1'] as String?,
        strMeasure2: data['strMeasure2'] as String?,
        strMeasure3: data['strMeasure3'] as String?,
        strMeasure4: data['strMeasure4'] as String?,
        strMeasure5: data['strMeasure5'] as String?,
        strMeasure6: data['strMeasure6'] as String?,
        strMeasure7: data['strMeasure7'] as String?,
        strMeasure8: data['strMeasure8'] as String?,
        strMeasure9: data['strMeasure9'] as String?,
        strMeasure10: data['strMeasure10'] as String?,
        strMeasure11: data['strMeasure11'] as String?,
        strMeasure12: data['strMeasure12'] as String?,
        strMeasure13: data['strMeasure13'] as String?,
        strMeasure14: data['strMeasure14'] as String?,
        strMeasure15: data['strMeasure15'] as String?,
        strMeasure16: data['strMeasure16'] as String?,
        strMeasure17: data['strMeasure17'] as String?,
        strMeasure18: data['strMeasure18'] as String?,
        strMeasure19: data['strMeasure19'] as String?,
        strMeasure20: data['strMeasure20'] as String?,
        strSource: data['strSource'] as String?,
        strImageSource: data['strImageSource'] as dynamic,
        strCreativeCommonsConfirmed:
            data['strCreativeCommonsConfirmed'] as dynamic,
        dateModified: data['dateModified'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'idMeal': idMeal,
        'strMeal': strMeal,
        'strDrinkAlternate': strDrinkAlternate,
        'strCategory': strCategory,
        'strArea': strArea,
        'strInstructions': strInstructions,
        'strMealThumb': strMealThumb,
        'strTags': strTags,
        'strYoutube': strYoutube,
        'strIngredient1': strIngredient1,
        'strIngredient2': strIngredient2,
        'strIngredient3': strIngredient3,
        'strIngredient4': strIngredient4,
        'strIngredient5': strIngredient5,
        'strIngredient6': strIngredient6,
        'strIngredient7': strIngredient7,
        'strIngredient8': strIngredient8,
        'strIngredient9': strIngredient9,
        'strIngredient10': strIngredient10,
        'strIngredient11': strIngredient11,
        'strIngredient12': strIngredient12,
        'strIngredient13': strIngredient13,
        'strIngredient14': strIngredient14,
        'strIngredient15': strIngredient15,
        'strIngredient16': strIngredient16,
        'strIngredient17': strIngredient17,
        'strIngredient18': strIngredient18,
        'strIngredient19': strIngredient19,
        'strIngredient20': strIngredient20,
        'strMeasure1': strMeasure1,
        'strMeasure2': strMeasure2,
        'strMeasure3': strMeasure3,
        'strMeasure4': strMeasure4,
        'strMeasure5': strMeasure5,
        'strMeasure6': strMeasure6,
        'strMeasure7': strMeasure7,
        'strMeasure8': strMeasure8,
        'strMeasure9': strMeasure9,
        'strMeasure10': strMeasure10,
        'strMeasure11': strMeasure11,
        'strMeasure12': strMeasure12,
        'strMeasure13': strMeasure13,
        'strMeasure14': strMeasure14,
        'strMeasure15': strMeasure15,
        'strMeasure16': strMeasure16,
        'strMeasure17': strMeasure17,
        'strMeasure18': strMeasure18,
        'strMeasure19': strMeasure19,
        'strMeasure20': strMeasure20,
        'strSource': strSource,
        'strImageSource': strImageSource,
        'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
        'dateModified': dateModified,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meal].
  factory Meal.fromJson(String data) {
    return Meal.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Meal] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      idMeal,
      strMeal,
      strDrinkAlternate,
      strCategory,
      strArea,
      strInstructions,
      strMealThumb,
      strTags,
      strYoutube,
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strIngredient6,
      strIngredient7,
      strIngredient8,
      strIngredient9,
      strIngredient10,
      strIngredient11,
      strIngredient12,
      strIngredient13,
      strIngredient14,
      strIngredient15,
      strIngredient16,
      strIngredient17,
      strIngredient18,
      strIngredient19,
      strIngredient20,
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5,
      strMeasure6,
      strMeasure7,
      strMeasure8,
      strMeasure9,
      strMeasure10,
      strMeasure11,
      strMeasure12,
      strMeasure13,
      strMeasure14,
      strMeasure15,
      strMeasure16,
      strMeasure17,
      strMeasure18,
      strMeasure19,
      strMeasure20,
      strSource,
      strImageSource,
      strCreativeCommonsConfirmed,
      dateModified,
    ];
  }
}
