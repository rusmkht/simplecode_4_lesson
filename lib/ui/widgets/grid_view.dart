
import 'package:flutter/material.dart';
import 'package:flutter_simplecode_4_lesson/models/Person.dart';
import 'package:flutter_simplecode_4_lesson/ui/widgets/person_grid_card.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<Person> personsList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.8,
      crossAxisCount: 2,
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      ),
      children: personsList.map((person) {
        return InkWell(
          child: PersonGridCard(person),
          onTap: () {},
        );
      }).toList(),
    );
  }
}
