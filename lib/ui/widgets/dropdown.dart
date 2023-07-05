import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_utils/utils/data.dart';

class DropDownDemo extends StatefulWidget {
  const DropDownDemo({super.key});

  @override
  State<DropDownDemo> createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String _selectedOption = "Dog";
  String _selectedOption1 = "Option 1";
  String _selectedOption2 = "Flash";
  String _selectedFruit = "🍎 Apple";
  String? selectedModelId;
  String? categoryValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              simple(),
              const SizedBox(
                height: 30,
              ),
              withIcon(),
              const SizedBox(
                height: 30,
              ),
              formField(),
              const SizedBox(
                height: 30,
              ),
              customDropDown(),
              const SizedBox(
                height: 30,
              ),
              modelDropDown(),
              const SizedBox(
                height: 30,
              ),
              uiDropDown()
            ],
          ),
        ),
      ),
    );
  }

  Widget simple() {
    return DropdownButton<String>(
      value: _selectedOption,
      isExpanded: true,
      items: <String>['Dog', 'Cat', 'Lion', 'Tiger'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue!;
        });
      },
    );
  }

  Widget withIcon() {
    return DropdownButton<String>(
      value: _selectedOption1,
      isExpanded: true,
      items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: ListTile(
            leading: const Icon(Icons.label),
            title: Text(value),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption1 = newValue!;
        });
      },
    );
  }

  Widget formField() {
    return DropdownButtonFormField<String>(
      value: _selectedOption2,
      isExpanded: true,
      items:
          <String>['Flash', 'Arrow', 'Batman', 'Superman'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption2 = newValue!;
        });
      },
      decoration: const InputDecoration(
        labelText: 'Dropdown FormField',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget customDropDown() {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.2),
            // border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0)),
        child: DropdownButton<String>(
            value: _selectedFruit,
            underline: Container(),
            iconEnabledColor: Colors.black,
            onChanged: (String? newValue) {
              setState(() {
                _selectedFruit = newValue!;
              });
            },
            hint: Text(
              "Select a fruit",
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            items: fruits
                .map((fruit) =>
                    DropdownMenuItem<String>(value: fruit, child: Text(fruit)))
                .toList()));
  }

  Widget modelDropDown() {
    final selectedModel = selectedModelId == null
        ? null
        : models.firstWhere((model) => model.id == selectedModelId);

    return DropdownButton<Model>(
      value: selectedModel,
      items: models
          .map((model) => DropdownMenuItem<Model>(
                value: model,
                child: Text(model.name),
              ))
          .toList(),
      hint: const Text("Custom model Type"),
      onChanged: (Model? newValue) {
        setState(() {
          selectedModelId = newValue?.id;
        });
      },
    );
  }

  Widget uiDropDown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50).copyWith(
              bottomRight: const Radius.circular(0),
              topLeft: const Radius.circular(0)),
          color: Colors.red.shade200),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            iconSize: 30,
            borderRadius: BorderRadius.circular(20)
                .copyWith(topLeft: const Radius.circular(0)),
            isExpanded: true,
            hint: Text('Custom UI ', style: GoogleFonts.poppins(fontSize: 15)),
            value: categoryValue,
            style: GoogleFonts.poppins(color: Colors.black),
            iconEnabledColor: Colors.black,
            items: [
              DropdownMenuItem(
                  value: 'Anime',
                  child: Text('Anime',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black))),
              DropdownMenuItem(
                  value: 'Tech',
                  child: Text('Tech',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.black))),
            ],
            onChanged: (val) {
              setState(() {
                categoryValue = val.toString();
              });
            }),
      ),
    );
  }
}
