import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/firestore_service.dart';

class TemplateManagerScreen extends StatefulWidget {
  const TemplateManagerScreen({super.key});

  @override
  State<TemplateManagerScreen> createState() => _TemplateManagerScreenState();
}

class _TemplateManagerScreenState extends State<TemplateManagerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sectionsController = TextEditingController();
  String _selectedCategory = 'Fresher';

  @override
  void dispose() {
    _nameController.dispose();
    _sectionsController.dispose();
    super.dispose();
  }

  Future<void> _addTemplate() async {
    final name = _nameController.text.trim();
    final sectionsText = _sectionsController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Template name is required')),
      );
      return;
    }

    final sections = sectionsText
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    try {
      await FirestoreService.addTemplate(
        name: name,
        category: _selectedCategory,
        sections: sections,
      );
      _nameController.clear();
      _sectionsController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Template added successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _deleteTemplate(String docId) async {
    try {
      await FirestoreService.deleteTemplate(docId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Template deleted')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Templates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add template form
            const Text(
              'Add New Template',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Template Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Fresher', child: Text('Fresher')),
                DropdownMenuItem(value: 'Experienced', child: Text('Experienced')),
              ],
              onChanged: (value) {
                setState(() => _selectedCategory = value ?? 'Fresher');
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _sectionsController,
              decoration: const InputDecoration(
                labelText: 'Sections (comma separated)',
                hintText: 'Summary, Skills, Experience, Education',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _addTemplate,
              child: const Text('Add Template'),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              'Existing Templates',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Template list
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirestoreService.getTemplates(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No templates found.'));
                  }

                  final templates = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: templates.length,
                    itemBuilder: (context, index) {
                      final templateData = templates[index].data() as Map<String, dynamic>;
                      final sections = (templateData['sections'] as List<dynamic>?)
                              ?.map((s) => s.toString())
                              .join(', ') ??
                          '';

                      return Card(
                        child: ListTile(
                          title: Text(templateData['name'] ?? 'Unnamed'),
                          subtitle: Text(
                            'Category: ${templateData['category'] ?? 'N/A'}\nSections: $sections',
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteTemplate(templates[index].id),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
