import 'package:e_commerci/myapp.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hhohpxukgoiptspoqwfi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhob2hweHVrZ29pcHRzcG9xd2ZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE4MTE5MDAsImV4cCI6MjA2NzM4NzkwMH0.hHPMVzumbIXijDoqqItuVV0CbqCGk0DTQXE5L0K3gpM',
  );
  runApp(const MyApp());
}

