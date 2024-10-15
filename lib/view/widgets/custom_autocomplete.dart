import 'package:flutter/material.dart';

class CustomAutocomplete<T extends Object> extends StatelessWidget {
  final String title;
  final List<T> options;
  final void Function(T) onSelected;
  final String Function(T) displayStringForOption;
  final bool Function(T, String) optionFilter;
  final String? Function(String?)? validator;

  const CustomAutocomplete({
    super.key,
    required this.title,
    required this.options,
    required this.onSelected,
    required this.displayStringForOption,
    required this.optionFilter,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Autocomplete<T>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return Iterable<T>.empty();
              }
              return options.where((T option) {
                return optionFilter(option, textEditingValue.text);
              });
            },
            displayStringForOption: displayStringForOption,
            onSelected: onSelected,
            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  suffixIcon: const Icon(Icons.search),
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                validator: validator,
              );
            },
            optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<T> onSelected, Iterable<T> options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32, // Ajusta a largura
                    constraints: BoxConstraints(
                      maxHeight: options.length * 50, // Limita a altura máxima do container
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final T option = options.elementAt(index);

                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(displayStringForOption(option)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
