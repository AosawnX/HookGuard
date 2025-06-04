import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';

void main() {
  runApp(HookGuardApp());
}

class HookGuardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HookGuard Dashboard',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DashboardHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HookGuard - Phishing Dashboard')),
      body: const Center(
        child: Text('Welcome to HookGuard!', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final msg = await ApiService.pingServer();

          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(msg)),
          );
        },
        tooltip: 'PIng',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
