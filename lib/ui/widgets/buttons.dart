import 'package:flutter/material.dart';
import 'package:widget_utils/utils/data.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  regularButton(),
                  iconOnRight(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  outlinedButton(),
                  textButton(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [imageButton(), onlyImage()],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [backColor(), fabbutton()],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  gradientutton(),
                  shadowbutton(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              fullWidth()
            ],
          ),
        ),
      ),
    );
  }
}

Widget regularButton() {
  return ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.download,
      size: 24.0,
    ),
    label: const Text('Download'),
  );
}

Widget outlinedButton() {
  return OutlinedButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.download,
      size: 24.0,
    ),
    label: const Text('Download'),
  );
}

Widget textButton() {
  return TextButton.icon(
    onPressed: () {},
    icon: const Icon(
      Icons.download,
      size: 24.0,
    ),
    label: const Text('Download'),
  );
}

Widget iconOnRight() {
  return ElevatedButton(
    onPressed: () {},
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Download'), // <-- Text
        SizedBox(
          width: 5,
        ),
        Icon(
          // <-- Icon
          Icons.download,
          size: 24.0,
        ),
      ],
    ),
  );
}

Widget imageButton() {
  return SizedBox.fromSize(
    size: const Size(60, 60),
    child: ClipOval(
      child: Material(
        color: Colors.purpleAccent[100],
        child: InkWell(
          splashColor: selectedColor,
          onTap: () {},
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.download,
                size: 25,
              ),
              Text("Tap"),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget gradientutton() {
  return GestureDetector(
    child: Container(
      width: 160,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.purpleAccent, selectedColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            "Download",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget shadowbutton() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      elevation: 15, // Adjust the elevation value as per your preference
      shadowColor: Colors.black.withOpacity(0.8), // Set the shadow color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "Download",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget fabbutton() {
  return FloatingActionButton.extended(
    onPressed: () {},
    icon: const Icon(Icons.download),
    label: const Text('Download'),
  );
}

Widget backColor() {
  return ElevatedButton.icon(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      backgroundColor: selectedColor, // Set the background color
    ),
    icon:
        const Icon(Icons.download, color: Colors.white), // Set the button icon
    label: const Text(
      'Download',
      style: TextStyle(color: Colors.white),
    ), // Set the button label
  );
}

Widget fullWidth() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // Add your button functionality here
      },
      child: const Text('Download'),
    ),
  );
}

Widget onlyImage() {
  return SizedBox.fromSize(
    size: const Size(60, 60),
    child: ClipOval(
      child: Material(
        color: Colors.purpleAccent[100],
        child: InkWell(
          splashColor: selectedColor,
          onTap: () {},
          child: const Icon(
            Icons.download,
            size: 35,
          ),
        ),
      ),
    ),
  );
}
