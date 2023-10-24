import 'package:bloc/bloc.dart';
import 'package:cake_app_test/model/ingredient_model.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeState.initial());
}
