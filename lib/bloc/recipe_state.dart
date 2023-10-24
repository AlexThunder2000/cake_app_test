part of 'recipe_cubit.dart';

class RecipeState {
  final List<IngredientModel> recipeMap;
  final List<double> diameterList;
  const RecipeState({required this.diameterList, required this.recipeMap});

  RecipeState.initial()
      : recipeMap = initialRecipeMap,
        diameterList = initialDiameterList;

  @override
  List<Object> get props => [recipeMap];
}

List<IngredientModel> initialRecipeMap = [
  IngredientModel(
    name: 'борошно1',
    weight: 500,
    unit: MeasureUnits.grams,
    section: 'На коржі',
  ),
  IngredientModel(
    name: 'молоко2',
    weight: 20,
    unit: MeasureUnits.grams,
    section: 'На коржі',
  ),
  IngredientModel(
    name: 'яйця3',
    weight: 5,
    unit: MeasureUnits.pcs,
    section: 'На коржі',
  ),
  IngredientModel(
    name: 'цукор4',
    weight: 100,
    unit: MeasureUnits.grams,
    section: 'На крем',
  ),
  IngredientModel(
    name: 'ваніль5',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'На крем',
  ),
  IngredientModel(
    name: 'сметана6',
    weight: 540,
    unit: MeasureUnits.grams,
    section: 'На крем',
  ),
  IngredientModel(
    name: 'цукор7',
    weight: 100,
    unit: MeasureUnits.grams,
    section: 'На крем',
  ),
  IngredientModel(
    name: 'ваніль8',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'На крем',
  ),
  IngredientModel(
    name: 'сметана9',
    weight: 540,
    unit: MeasureUnits.grams,
    section: 'На крем',
  ),
  IngredientModel(
    name: 'цукор10',
    weight: 100,
    unit: MeasureUnits.grams,
    section: 'На друге',
  ),
  IngredientModel(
    name: 'ваніль11ророророророрлорлорлорл',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'На друге',
  ),
  IngredientModel(
    name: 'сметана12',
    weight: 540,
    unit: MeasureUnits.grams,
    section: 'На друге',
  ),
  IngredientModel(
    name: 'цукор13',
    weight: 100,
    unit: MeasureUnits.grams,
    section: 'На друге',
  ),
  IngredientModel(
    name: 'ваніль14',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'На друге',
  ),
  IngredientModel(
    name: 'сметана15',
    weight: 540,
    unit: MeasureUnits.grams,
    section: 'На друге',
  ),
  IngredientModel(
    name: 'цукор16',
    weight: 100,
    unit: MeasureUnits.grams,
    section: 'На третє',
  ),
  IngredientModel(
    name: 'ваніль17',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'На третє',
  ),
  IngredientModel(
    name: 'ваніль18',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'На третє',
  ),
  IngredientModel(
    name: 'сметана19',
    weight: 540,
    unit: MeasureUnits.grams,
    section: 'На третє',
  ),
  IngredientModel(
    name: 'цукор20',
    weight: 100,
    unit: MeasureUnits.grams,
    section: 'На четверте',
  ),
  IngredientModel(
    name: 'ваніль21',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'На четверте',
  ),
  IngredientModel(
    name: 'сметана22',
    weight: 540,
    unit: MeasureUnits.grams,
    section: 'На четверте',
  ),
  IngredientModel(
    name: 'цукор23',
    weight: 100,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль24',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль25',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль26',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль27',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль28',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль29',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль30',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль31',
    weight: 12,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
  IngredientModel(
    name: 'ваніль32',
    weight: 12000,
    unit: MeasureUnits.grams,
    section: 'Ще на шось',
  ),
];

List<double> initialDiameterList = [
  10,
  11,
  12,
  13,
  14,
  15,
  // 16,
  // 17,
  // 18,
  // 19,
  // 20,
  // 21,
  // 22,
  // 23,
  // 24,
  // 25,
  // 26,
  // 27,
  // 28,
  // 29,
  // 30
];
