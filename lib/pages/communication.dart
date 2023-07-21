import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunicationPage extends StatefulWidget {
  const CommunicationPage({Key? key}) : super(key: key);

  @override
  State<CommunicationPage> createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> {
  void _launchWhatsApp() async {
    final phoneNumber = '+905550680362';
    final text = 'Merhaba, size bir mesaj göndermek istiyorum!';
    final url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeQueryComponent(text)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'WhatsApp açılamadı';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WhatsApp Projesi")),
      body: Center(
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.whatsapp,
            size: 50,
            color: Colors.green,
          ),
          onPressed: _launchWhatsApp,
        ),
      ),
    );
  }
}
