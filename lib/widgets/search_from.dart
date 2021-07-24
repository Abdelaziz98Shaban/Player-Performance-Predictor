import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  SearchForm({this.onSearch});

  final void Function(String search) onSearch;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  var _autoValidate = false;
  var _search;

  @override
  Widget build(context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          // ignore: deprecated_member_use
          autovalidate: _autoValidate,
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Enter player name ',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                  filled: true,
                  errorStyle: TextStyle(fontSize: 15),
                ),
                onChanged: (value) {
                  _search = value;
                },
                validator: (value) {
                  if (value.isEmpty || value.length < 4) {
                    return 'Please enter a search term of  least 4 characters.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: () {
                    final isValid = _formKey.currentState.validate();
                    if (isValid) {
                      widget.onSearch(_search);
                      // Collapses keypad
                      FocusManager.instance.primaryFocus.unfocus();
                    } else {
                      setState(() {
                        _autoValidate = true;
                      });
                    }
                  },
                  fillColor: Color(0xff246BFD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
