import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

//stateful widget because the filters that users use have to be managed.
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.setFilters, this.currentFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilters['gluten'] ?? false;
    vegetarian = widget.currentFilters['vegetarian'] ?? false;
    vegan = widget.currentFilters['vegan'] ?? false;
    lactoseFree = widget.currentFilters['lactose'] ?? false;
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool condition, Function(bool) funct) {
    return SwitchListTile(
      value: condition,
      onChanged: funct,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': glutenFree,
                    'lactose': lactoseFree,
                    'vegan': vegan,
                    'vegetarian': vegetarian
                  };
                  widget.setFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildSwitchListTile(
                'Gluten-Free', 'To include gluten-free meals', glutenFree,
                (newValue) {
              setState(() {
                glutenFree = newValue;
              });
            }),
            buildSwitchListTile(
                'Vegetarian', 'To include vegetarian meals', vegetarian,
                (newValue) {
              setState(() {
                vegetarian = newValue;
              });
            }),
            buildSwitchListTile('Vegan', 'To include vegan meals', vegan,
                (newValue) {
              setState(() {
                vegan = newValue;
              });
            }),
            buildSwitchListTile(
                'Lactose-Free', 'To include lactose free meals', lactoseFree,
                (newValue) {
              setState(() {
                lactoseFree = newValue;
              });
            }),
          ],
        ));
  }
}
