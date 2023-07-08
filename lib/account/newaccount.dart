import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class NewAcount extends StatefulWidget {
  const NewAcount({Key? key}) : super(key: key);

  @override
  State<NewAcount> createState() => _NewAcountState();
}

class _NewAcountState extends State<NewAcount> {
  File? _image;
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  String _selectedCountryCode = "+1";
  TextEditingController _phoneNumberController = TextEditingController();
  Country? _selectedCountry;

  List<Country> _countries = [
    Country(name: "United States", code: "+1", flag: "🇺🇸"),
    Country(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    Country(name: "India", code: "+91", flag: "🇮🇳"),
    // Add more countries as needed
  ];

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        final formattedDate = DateFormat.MMMM().format(picked);
        _dateController.text = "${picked.day}-$formattedDate-${picked.year}";
      });
    }
  }



  Future<void> _selectCountryCode() async {
    final result = await showModalBottomSheet<Country>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: ListView.builder(
            itemCount: _countries.length,
            itemBuilder: (BuildContext context, int index) {
              final country = _countries[index];
              return ListTile(
                leading: Text(country.flag, style: TextStyle(fontSize: 24)),
                title: Text("${country.name} (${country.code})"),
                onTap: () {
                  Navigator.pop(context, country);
                },
              );
            },
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        _selectedCountry = result;
        _phoneNumberController.text = result.code;
      });
    }
  }

  void _selectGender() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(

          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(

                title: Text('Male'),
                leading: Radio<String>(
                  value: 'Male',
                  groupValue: _genderController.text,
                  onChanged: (value) {
                    Navigator.pop(context, value);
                  },
                ),
              ),
              ListTile(

                title: Text('Female'),
                leading: Radio<String>(
                  value: 'Female',
                  groupValue: _genderController.text,
                  onChanged: (value) {
                    Navigator.pop(context, value);
                  },
                ),
              ),
              ListTile(

                title: Text('Others'),
                leading: Radio<String>(
                  value: 'Others',
                  groupValue: _genderController.text,
                  onChanged: (value) {
                    Navigator.pop(context, value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        _genderController.text = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Your Profile",style: TextStyle(color: Colors.black,fontSize: 20),) ,
        leading: IconButton(
          padding: EdgeInsets.only(left: 15),
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
         child: Column(

          children:[ Stack(
            alignment: Alignment.center,
            children: [

              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(
                    Icons.person_2,
                    size: 150,
                    color: Colors.white,
                  )
                      : null,
                ),
              ),
              Positioned(
                bottom: 2,
                right: 110,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select Profile Picture'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.photo),
                                title: Text('Choose from Gallery'),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text('Take a Photo'),
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.edit, size: 20),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: Colors.blueAccent.shade700,
                    padding: EdgeInsets.all(8),
                    minimumSize: Size(5,5),
                  ),
                ),
              ),
            ],
          ),

            SizedBox(height: 25,),


            Container(
                padding: EdgeInsets.only(left: 20,right: 20,),
                height: 45,
                child:
                // Note: Same code is applied for the TextFormField as well
                TextField(

                  decoration: InputDecoration(


                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    // focusColor: Colors.blueAccent.shade700,


                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0, color: Colors.grey.shade100,

                        ),
                        borderRadius: BorderRadius.circular(10)//<-- SEE HERE
                    ),

                  ),

                )

            ),

            SizedBox(height: 25,),


            Container(
                padding: EdgeInsets.only(left: 20,right: 20,),
                height: 45,
                child:
                // Note: Same code is applied for the TextFormField as well
                TextField(

                  decoration: InputDecoration(


                    hintText: "Nickname",
                    hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    // focusColor: Colors.blueAccent.shade700,


                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0, color: Colors.grey.shade100,

                        ),
                        borderRadius: BorderRadius.circular(10)//<-- SEE HERE
                    ),

                  ),

                )

            ),

            SizedBox(height: 25,),


            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 45,
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: "Date of Birth",
                  hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.grey.shade100,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Code to open calendar
                      _selectDate();
                    },
                    icon: Icon(Icons.calendar_month_rounded,color: Colors.grey.shade500,),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25,),


            Container(
                padding: EdgeInsets.only(left: 20,right: 20,),
                height: 45,
                child:
                // Note: Same code is applied for the TextFormField as well
                TextField(

                  decoration: InputDecoration(

                    suffixIcon: Icon(Icons.email_outlined,color: Colors.grey.shade500,),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    // focusColor: Colors.blueAccent.shade700,


                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0, color: Colors.grey.shade100,

                        ),
                        borderRadius: BorderRadius.circular(10)//<-- SEE HERE
                    ),

                  ),

                )

            ),

            SizedBox(height: 25,),


            Container(
                padding: EdgeInsets.only(left: 20,right: 20,),
                height: 45,
                child:
                // Note: Same code is applied for the TextFormField as well
                TextField(

                  decoration: InputDecoration(


                    hintText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    // focusColor: Colors.blueAccent.shade700,


                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0, color: Colors.grey.shade100,

                        ),
                        borderRadius: BorderRadius.circular(10)//<-- SEE HERE
                    ),
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone, color: Colors.grey.shade500),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            _selectCountryCode();
                          },
                          icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                    prefixText: _selectedCountryCode,
                    prefixStyle: TextStyle(color: Colors.black,fontSize: 15.5 )

                  ),

                )

            ),

            SizedBox(height: 25,),


            Container(
                padding: EdgeInsets.only(left: 20,right: 20,),
                height: 45,
                child:
                // Note: Same code is applied for the TextFormField as well
                TextField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: () {_selectGender();},
                        icon: Icon(Icons.arrow_drop_down_rounded,size: 31,)),
                    hintText: "Gender",
                    hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    // focusColor: Colors.blueAccent.shade700,


                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0, color: Colors.grey.shade100,

                        ),
                        borderRadius: BorderRadius.circular(10)//<-- SEE HERE
                    ),

                  ),

                )

            ),
            
            SizedBox(height: 25,),

            Container(
              width: double.infinity,
              height: 45,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text('Continue',style: TextStyle(fontSize: 15),),
                style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.blueAccent.shade700,elevation: 9,),
              ),
            ),
        ]
        ),
      ),
    );
  }
}


class Country {
  final String name;
  final String code;
  final String flag;

  Country({
    required this.name,
    required this.code,
    required this.flag,
  });
}