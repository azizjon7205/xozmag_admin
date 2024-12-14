import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../widgets/create_category_section.dart';


@RoutePage()
class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CreateCategorySection(),
    );
  }
}
