// Settings Page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
// Page imports

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _value = false;
  TextStyle style = GoogleFonts.dosis(fontSize: 16.0);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _suggestionController = TextEditingController();

  TextFormField _nameFormField() {
    return TextFormField(
      obscureText: false,
      style: style,
      controller: _nameController,
      decoration: InputDecoration(
        filled: true,
        //fillColor: Colors.grey[450],
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Name',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField _emailFormField() {
    return TextFormField(
      obscureText: false,
      style: style,
      controller: _emailController,
      decoration: InputDecoration(
        filled: true,
        //fillColor: Colors.grey[450],
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Email Address',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField _suggestionFormField() {
    return TextFormField(
      maxLines: 4,
      obscureText: false,
      style: style,
      controller: _suggestionController,
      decoration: InputDecoration(
        filled: true,
        //fillColor: Colors.grey[450],
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Suggestion',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Center(
                child: Text(
                  'Settings',
                  style: GoogleFonts.dosis(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(
                      'Preferences',
                      style: GoogleFonts.dosis(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.nights_stay,
                    color: Color(0xFF404040),
                  ),
                  title: Text(
                    'Dark Mode',
                    style: GoogleFonts.dosis(fontSize: 18),
                  ),
                  trailing: Container(
                    child: Switch(
                      value: _value,
                      onChanged: (_isOn) {
                        _isOn =
                            true; // TODO: Update the whole app on Bool Value
                        setState(() {
                          if (_value == false) {
                            _value = _isOn;
                            AdaptiveTheme.of(context).setDark();
                          } else if (_value == true) {
                            _value = false;
                            AdaptiveTheme.of(context).setLight();
                          }
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(
                      'Feedback',
                      style: GoogleFonts.dosis(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ListTile(
                  onTap: () {
                    _showDebugDialog();
                  },
                  leading: Icon(Icons.warning, color: Color(0xFFF9A03F)),
                  title: Text(
                    'Report a bug',
                    style: GoogleFonts.dosis(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: ListTile(
                  onTap: () {
                    _showFeedBackDialog();
                  },
                  leading: Icon(Icons.send_rounded, color: Color(0xFF1E2EDE)),
                  title: Text(
                    'Send us a feedback',
                    style: GoogleFonts.dosis(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showFeedBackDialog() async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Feel free to chat with us"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  _nameFormField(),
                  SizedBox(
                    height: 10,
                  ),
                  _emailFormField(),
                  SizedBox(
                    height: 10,
                  ),
                  _suggestionFormField(),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text('SEND')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _nameController.clear();
                    _emailController.clear();
                    _suggestionController.clear();
                  },
                  child: Text('CANCEL')),
            ],
          );
        });
  }

  Future<void> _showDebugDialog() async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Report a bug"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  _nameFormField(),
                  SizedBox(
                    height: 10,
                  ),
                  _emailFormField(),
                  SizedBox(
                    height: 10,
                  ),
                  _suggestionFormField(),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text('SEND')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _nameController.clear();
                    _emailController.clear();
                    _suggestionController.clear();
                  },
                  child: Text('CANCEL')),
            ],
          );
        });
  }
}
