import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateApiaryScreen extends StatefulWidget {
  const CreateApiaryScreen({Key? key}) : super(key: key);

  @override
  State<CreateApiaryScreen> createState() => _CreateApiaryScreenState();
}

class _CreateApiaryScreenState extends State<CreateApiaryScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final sunExposureController = TextEditingController();
  final humidityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create apiary"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(6),
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter longer name!';
                    }
                    return null;
                  },
                  controller: nameController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Description',

                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description cannot be so short!';
                    }
                    return null;
                  },
                  controller: descriptionController,
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Location',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Location cannot be so short!';
                    }
                    return null;
                  },
                  controller: locationController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Humidity',
                  ),
                  validator: (value) {
                        if(value != null && int.tryParse(value) != null && (
                        int.tryParse(value)! >= 10 ||
                        int.tryParse(value)! <= -10)) {
                      return 'Wrong value of humidity';
                    }
                    return null;
                  },
                  controller: humidityController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Sun Exposure',
                  ),
                  validator: (value) {
                    if(value != null && int.tryParse(value) != null && (
                        int.tryParse(value)! >= 10 ||
                            int.tryParse(value)! <= -10)) {
                      return 'Wrong value of sun exposure';
                    }
                    return null;
                  },
                  controller: sunExposureController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                child: ElevatedButton(
                  child: Text("Submit",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(nameController.text)),
                      );
                    }
                  },
                  // style: ButtonStyle(
                  //   backgroundColor:
                  //       MaterialStateProperty.all(Theme.of(context).primaryColor),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
