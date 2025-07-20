import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

import 'backend/supabase/supabase.dart';

class VideoUploadTestPage extends StatefulWidget {
  const VideoUploadTestPage({super.key});

  @override
  State<VideoUploadTestPage> createState() => _VideoUploadTestPageState();
}

class _VideoUploadTestPageState extends State<VideoUploadTestPage> {
  File? _selectedFile;
  String? _uploadedUrl;
  bool _isUploading = false;

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadToSupabase() async {
    if (_selectedFile == null) return;

    final fileName = 'video_${DateTime.now().millisecondsSinceEpoch}${p.extension(_selectedFile!.path)}';
    final fileBytes = await _selectedFile!.readAsBytes();
    final mimeType = lookupMimeType(_selectedFile!.path) ?? 'video/mp4';

    setState(() => _isUploading = true);

    try {
      final supabase = AppSupabase.instance.client;
      final storageResponse = await supabase.storage
          .from('boom-bucket') // имя бакета в Supabase
          .uploadBinary(fileName, fileBytes,
          fileOptions: FileOptions(
            contentType: mimeType,
            upsert: true,
          ));

      final publicUrl = supabase.storage.from('boom-bucket').getPublicUrl(fileName);

      setState(() {
        _uploadedUrl = publicUrl;
        _isUploading = false;
      });
    } catch (e) {
      setState(() => _isUploading = false);
      print('Ошибка загрузки: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка загрузки: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Загрузка видео в Supabase')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickVideo,
              child: const Text('Выбрать видео'),
            ),
            if (_selectedFile != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text('Файл: ${p.basename(_selectedFile!.path)}'),
              ),
            ElevatedButton(
              onPressed: _selectedFile != null && !_isUploading ? _uploadToSupabase : null,
              child: _isUploading
                  ? const CircularProgressIndicator()
                  : const Text('Загрузить в Supabase'),
            ),
            const SizedBox(height: 20),
            if (_uploadedUrl != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Загружено! Ссылка:'),
                  SelectableText(_uploadedUrl!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}