import 'package:expense_repository/expense_repository.dart';
import 'package:expensetracker/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';


Future getCategoryCreation(BuildContext context) {
  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel',
  ];
  
  return showDialog(
    context: context,
    builder: (ctx) {
      bool isExpended = false;
      String iconSelected = '';
      Color categoryColor = Colors.grey.shade100;
      TextEditingController categoryNameController =TextEditingController();
      TextEditingController categoryIconController =TextEditingController();
      TextEditingController categoryColorController =TextEditingController();
      bool isLoading = false;
      Category category =Category.empty;

      return BlocProvider.value(
        value: context.read<CreateCategoryBloc>(),
        child: StatefulBuilder(
          builder: (ctx, setState) {
          return BlocListener<CreateCategoryBloc, CreateCategoryState>(
            listener: (context, state) {
              if (state is CreateCategorySuccess) {
                Navigator.pop(ctx, category);
              } else if (state is CreateCategoryLoading) {
                setState(() {
                  isLoading = true;
                });
              }
            },
            child: AlertDialog(
              title: Text('Create a Category'),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: categoryNameController,
                      textAlignVertical:
                          TextAlignVertical.center,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: categoryIconController,
                      onTap: () {
                        setState(() {
                          isExpended = !isExpended;
                        });
                      },
                      textAlignVertical:
                          TextAlignVertical.center,
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        suffixIcon: Icon(
                          CupertinoIcons.chevron_down,
                          size: 12,
                        ),
                        fillColor: Colors.grey.shade100,
                        hintText: 'Icon',
                        border: OutlineInputBorder(
                          borderRadius:
                              isExpended
                                  ? BorderRadius.vertical(
                                    top: Radius.circular(
                                      12,
                                    ),
                                  )
                                  : BorderRadius.circular(
                                    12,
                                  ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    isExpended
                        ? Container(
                          width:
                              MediaQuery.of(
                                context,
                              ).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(
                                  bottom: Radius.circular(
                                    12,
                                  ),
                                ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                  ),
                              itemCount:
                                  myCategoriesIcons
                                      .length,
                              itemBuilder: (
                                context,
                                int i,
                              ) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      iconSelected =
                                          myCategoriesIcons[i];
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 3,
                                        color:
                                            iconSelected ==
                                                    myCategoriesIcons[i]
                                                ? Colors
                                                    .green
                                                : Colors
                                                    .grey,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(
                                            12,
                                          ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/${myCategoriesIcons[i]}.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                        : Container(),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: categoryColorController,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx2) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize:
                                    MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                    pickerColor:
                                        categoryColor,
                                    onColorChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        categoryColor =
                                            value;
                                      });
                                    },
                                  ),
                      
                                  SizedBox(
                                    width:
                                        double.infinity,
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                          ctx2,
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(
                                                12,
                                              ),
                                        ),
                                      ),
                                      child: Text(
                                        'Save Color',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Colors
                                                  .white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      textAlignVertical:
                          TextAlignVertical.center,
                      // readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: categoryColor,
                        hintText: 'Color',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: isLoading == true
                        ? Center(
                          child: CircularProgressIndicator(),
                        )
                        : TextButton(
                            onPressed: () {
                              
                              // Kategoriyi olusturan nesne ----------------
                              setState(() {
                                category.categoryId =Uuid().v1();
                              category.name =categoryNameController.text;
                              category.icon = iconSelected;
                              category.color = categoryColor.value;
                              });
                              
                            
                              context.read<CreateCategoryBloc>().add(CreateCategory(category));
                              // Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ));
    },
  );
}