import 'dart:math';

import 'package:cake_app_test/bloc/recipe_cubit.dart';
import 'package:cake_app_test/model/ingredient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFPreviewPage extends StatelessWidget {
  const PDFPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCubit(),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Перегляд рецепту'),
            ),
            body: PdfPreview(
              canChangePageFormat: false,
              canChangeOrientation: false,
              allowPrinting: true,
              allowSharing: true,
              canDebug: false,
              pdfFileName: 'Cake_Name',
              maxPageWidth: 900,
              initialPageFormat: PdfPageFormat.a4.landscape,
              build: (PdfPageFormat format) => generateTable(
                pageFormat: format,
                ingredientList: state.recipeMap,
                diameterList: state.diameterList,
                initialDiameter: 15,
                diameterOnOnePage: 6,
                ingredientOnOnePage: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<Uint8List> generateTable({
  required PdfPageFormat pageFormat,
  required List<IngredientModel> ingredientList,
  required List<double> diameterList,
  required double initialDiameter,
  required int diameterOnOnePage,
  required int ingredientOnOnePage,
}) async {
  final document = pw.Document();
  final ttf = pw.Font.ttf(await rootBundle.load("assets/fonts/arial.ttf"));

  // ingredientList.sort((a, b) => a.section.compareTo(b.section));

  List<double> diameterListClone = [...diameterList];

  while (diameterListClone.isNotEmpty) {
    List<double> diameterListSubset =
        diameterListClone.take(diameterOnOnePage).toList();

    List<IngredientModel> tempIngredientList = [...ingredientList];
    String? lastSection;

    while (tempIngredientList.isNotEmpty) {
      List<IngredientModel> ingredientListSubset =
          tempIngredientList.take(ingredientOnOnePage).toList();
      List<pw.TableRow> tableRows = [];

      tableRows.add(
        pw.TableRow(
          children: [
            pw.Padding(
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: pw.Text(
                'Інгредієнти',
                textAlign: pw.TextAlign.center,
              ),
            ),
            for (var diameter in diameterListSubset)
              pw.Text('$diameter см', textAlign: pw.TextAlign.center),
          ],
        ),
      );

      for (var ingredient in ingredientListSubset) {
        if (lastSection != ingredient.section) {
          lastSection = ingredient.section;

          tableRows.add(
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  child: pw.Text(
                    ingredient.section,
                    textScaleFactor: 1.2,
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }
        tableRows.add(
          pw.TableRow(
            children: [
              pw.Padding(
                padding:
                    const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: pw.Text(ingredient.name, textAlign: pw.TextAlign.left),
              ),
              for (var diameter in diameterListSubset)
                pw.Text(
                  (ingredient.weight * diameter / initialDiameter)
                      .toStringAsFixed(2),
                  textAlign: pw.TextAlign.center,
                ),
            ],
          ),
        );
      }

      document.addPage(
        pw.Page(
          pageTheme: pw.PageTheme(
            margin: const pw.EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            pageFormat: pageFormat,
            orientation: pw.PageOrientation.landscape,
            theme: pw.ThemeData.withFont(base: ttf),
          ),
          build: (context) {
            return pw.Table(
              tableWidth: pw.TableWidth.min,
              columnWidths: const <int, pw.TableColumnWidth>{
                0: pw.FixedColumnWidth(100),
              },
              defaultColumnWidth: const pw.FixedColumnWidth(80),
              border: pw.TableBorder.all(),
              defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
              children: tableRows,
            );
          },
        ),
      );

      tempIngredientList.removeRange(
          0, min(ingredientOnOnePage, tempIngredientList.length));
    }

    diameterListClone.removeRange(
        0, min(diameterOnOnePage, diameterListClone.length));
  }

  return document.save();
}
