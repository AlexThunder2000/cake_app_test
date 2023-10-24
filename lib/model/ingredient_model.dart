enum MeasureUnits { grams, pcs }

class IngredientModel {
  late final String name;
  final String section;
  late final double weight;
  late final MeasureUnits unit;

  IngredientModel({
    required this.name,
    required this.section,
    required this.weight,
    required this.unit,
  });
}
