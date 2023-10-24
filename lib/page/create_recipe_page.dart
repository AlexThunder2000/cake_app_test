import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:cake_app_test/model/ingredient_model.dart';
import 'package:cake_app_test/page/pdf_preview_page.dart';
import 'package:cake_app_test/utils/color_source.dart';
import 'package:cake_app_test/utils/icon_source.dart';
import 'package:cake_app_test/utils/text_style_source.dart';
import 'package:cake_app_test/widget/custom_elevated_button.dart';
import 'package:cake_app_test/widget/custom_outlined_button.dart';
import 'package:cake_app_test/widget/custom_text_button.dart';
import 'package:cake_app_test/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateRecipePage extends StatelessWidget {
  const CreateRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSourceApp.lightGrey,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PDFPreviewPage()),
        );
      }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 316, vertical: 80),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(11, 11, 34, 0.05),
              blurRadius: 40.0,
              spreadRadius: -9.0,
              offset: Offset(0, 25),
            )
          ],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: const RecipeForm(),
      ),
    );
  }
}

class VideoBackground extends StatelessWidget {
  const VideoBackground({Key? key}) : super(key: key); // Fixed constructor

  @override
  Widget build(BuildContext context) {
    final videoElement = html.VideoElement()
      ..src =
          'https://drive.google.com/uc?export=download&confirm=no_antivirus&id=1d5Oec5623iMpvDktQsWqWale8jPr5SHP'
      ..autoplay = true
      ..loop = true
      ..muted = true
      ..style.position = 'absolute'
      ..style.top = '0'
      ..style.left = '0'
      ..style.bottom = '0'
      ..style.right = '0'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'cover';

    // Wrap the video element in a div element
    final divElement = html.DivElement()
      ..style.width = '100%'
      ..style.height = '100%'
      ..append(videoElement);

    const viewType = 'video-background';
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) => divElement,
    );

    return const HtmlElementView(viewType: viewType);
  }
}

class Section {
  String name;
  List<IngredientModel> ingredients;

  Section({required this.name, required this.ingredients});
}

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  List<Section> sections = [
    Section(name: '', ingredients: []),
  ];

  void addSection() {
    setState(() {
      sections.add(
        Section(name: '', ingredients: []),
      );
    });
  }

  void removeSection(int index) {
    setState(() {
      sections.removeAt(index);
    });
  }

  void addIngredient(int sectionIndex) {
    setState(() {
      sections[sectionIndex].ingredients.add(
            IngredientModel(
              name: '',
              section: sections[sectionIndex].name,
              weight: 0.0,
              unit: MeasureUnits.grams,
            ),
          );
    });
  }

  void removeIngredient(int sectionIndex, int ingredientIndex) {
    setState(() {
      sections[sectionIndex].ingredients.removeAt(ingredientIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: ColorSourceApp.lightGrey),
      ),
      child: ListView(
        children: [
          for (int i = 0; i < sections.length; i++)
            Column(
              children: [
                CustomTextField(
                  hintText: 'Назва блоку',
                  onChanged: (text) {},
                  // suffixIcon: Icon(Icons.remove_red_eye),
                  prefixIcon: SvgPicture.asset(IconSourceApp.user),
                ),
                ...[
                  for (int j = 0; j < sections[i].ingredients.length; j++)
                    IngredientForm(
                      ingredient: sections[i].ingredients[j],
                      remove: () => removeIngredient(i, j),
                    )
                ],
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      isEnabled: true,
                      callback: () {},
                      title: 'Зберегти',
                      leadingIcon: const Icon(Icons.save),
                    ),
                    CustomOutlinedButton(
                      isEnabled: true,
                      callback: () {},
                      title: 'Зберегти',
                      leadingIcon: const Icon(Icons.save),
                    ),
                    CustomTextButton(
                      isEnabled: true,
                      callback: () {},
                      title: 'Зберегти',
                      leadingIcon: const Icon(Icons.save),
                    ),
                    GestureDetector(
                      onTap: () => addIngredient(i),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Інгредієнт',
                              style: TextStyleSourceApp.helvetica16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => removeSection(i),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.restore_from_trash_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Видалити блок',
                            style: TextStyleSourceApp.helvetica16
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          CustomElevatedButton(
            isEnabled: true,
            callback: () {
              addSection();
            },
            title: 'Add Section',
          ),
        ],
      ),
    );
  }
}

class IngredientForm extends StatefulWidget {
  final IngredientModel ingredient;
  final VoidCallback remove;

  const IngredientForm(
      {super.key, required this.ingredient, required this.remove});

  @override
  State<IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<IngredientForm> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Грам', 'штук'];
    String dropdownValue = list.first;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CustomTextField(
              hintText: 'назва інгредієнта',
              onChanged: (value) {
                widget.ingredient.name = value;
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              hintText: 'кількість',
              onChanged: (value) {
                widget.ingredient.weight = double.tryParse(value) ?? 0.0;
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(
                    color: ColorSourceApp.lightGrey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(
                    color: ColorSourceApp.lightGrey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: const BorderSide(
                    color: ColorSourceApp.lightGrey,
                  ),
                ),
              ),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              widget.remove();
            },
            child: const Icon(Icons.close, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
