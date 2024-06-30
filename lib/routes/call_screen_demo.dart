import 'package:flutter/material.dart';
import 'package:dial_zero/utils/call_screen_utilities.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  List<Map<String, dynamic>> audioDevices = [];
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadAudioDevices();
  }

  Future<void> _loadAudioDevices() async {
    final devices = await getAvailableAudioDevices();
    setState(() {
      audioDevices = devices;
    });
  }

  Future<void> _initiateCall() async {
    final phoneNumber = _phoneNumberController.text;
    if (phoneNumber.isNotEmpty) {
      final success = await initiateCall(phoneNumber);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to initiate call. Check permissions.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Manager')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          ElevatedButton(
            child: Text('Initiate Call'),
            onPressed: _initiateCall,
          ),
          ElevatedButton(
            child: Text('Toggle Recording'),
            onPressed: () => toggleCallRecording(),
          ),
          ElevatedButton(
            child: Text('End Call'),
            onPressed: () => endCall(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: audioDevices.length,
              itemBuilder: (context, index) {
                final device = audioDevices[index];
                return ListTile(
                  title: Text(device['name']),
                  subtitle: Text(device['isOutput'] ? 'Output' : 'Input'),
                  onTap: () => changeAudioDevice(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}