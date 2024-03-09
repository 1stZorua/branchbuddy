import "package:branchbuddy/models/tree.dart";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:go_router/go_router.dart";
import "package:branchbuddy/providers/index.dart" show TreeProvider;
import "package:branchbuddy/widgets/index.dart" show TextMedium, ButtonPrimary, TextLarge;
import "package:intl/intl.dart";
import "package:provider/provider.dart";

class CreateScreen extends StatefulWidget {
  const CreateScreen({ super.key });

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final List<String> _species = ["Oak Tree"];
  final _formKey = GlobalKey<FormState>();

  DateTime _date = DateTime.now();
  Position? _currentPosition;

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _date = pickedDate;
      });
    });
  }

  // This function handles the location permission
  Future<bool> _handleLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }

    return permission != LocationPermission.deniedForever;
  }

  // This function grabs the current location of the user
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }


  @override
  Widget build(BuildContext context){
    final TreeProvider treeProvider = Provider.of<TreeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        title: const TextLarge(text: "Plant Tree", style: TextStyle(fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextLarge(text: "Species"),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      isDense: false,
                      items: _species.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {},
                      value: _species[0]
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextLarge(text: "Date"),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _presentDatePicker,
                      child: TextMedium(text: DateFormat('dd/MM/yyyy').format(_date))
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextLarge(text: "Location"),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _getCurrentPosition, 
                      child: TextMedium(text: (_currentPosition != null ? "lat: ${_currentPosition!.latitude}, long: ${_currentPosition!.longitude}" : "Get Location"))
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                child: ButtonPrimary(
                  onPressed: () {
                    if (_currentPosition == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const TextMedium(text: "Location required."),
                          backgroundColor: Theme.of(context).colorScheme.background,
                        )
                      );
                      return;
                    }

                    treeProvider.addTree(
                      Tree(
                        species: _species[0], 
                        plantingDate: _date, 
                        location: "lat: ${_currentPosition!.latitude}, long: ${_currentPosition!.longitude}"
                      )
                    );

                    GoRouter.of(context).goNamed("track");
                  },
                  text: "Plant Tree",
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}