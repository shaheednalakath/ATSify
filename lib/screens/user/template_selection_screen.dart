import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/resume_provider.dart';
import '../../services/firestore_service.dart';

class TemplateSelectionScreen extends StatelessWidget {
  const TemplateSelectionScreen({super.key});

  // Built-in templates (always available)
  static const List<Map<String, String>> builtInTemplates = [
    {'name': 'Modern Template', 'id': 'modern'},
    {'name': 'Classic Template', 'id': 'classic'},
    {'name': 'Fresher Template', 'id': 'fresher'},
    {'name': 'Experience Template', 'id': 'experience'},
    {'name': 'Skills Template', 'id': 'skills'},
    {'name': 'Compact Template', 'id': 'compact'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Template'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: 'Admin Login',
            onPressed: () {
              Navigator.pushNamed(context, '/admin-login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ResumeProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Built-in templates section
                const Text(
                  'Built-in Templates',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  flex: 1,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: builtInTemplates.length,
                    itemBuilder: (context, index) {
                      final template = builtInTemplates[index];
                      final isSelected = provider.selectedTemplate == template['id'];

                      return _buildTemplateCard(
                        context: context,
                        name: template['name']!,
                        templateId: template['id']!,
                        isSelected: isSelected,
                        provider: provider,
                      );
                    },
                  ),
                ),
                const Divider(),
                const SizedBox(height: 8),
                // Mock templates section
                const Text(
                  'Custom Templates (Local Mock)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  flex: 1,
                  child: StreamBuilder<List<Map<String, dynamic>>>(
                    stream: FirestoreService.getTemplates(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No custom templates yet.\nAdmin can add them.'),
                        );
                      }

                      final templates = snapshot.data!;

                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: templates.length,
                        itemBuilder: (context, index) {
                          final data = templates[index];
                          final name = data['name'] ?? 'Unnamed';
                          final category = data['category'] ?? '';

                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.description, size: 48, color: Colors.grey),
                                const SizedBox(height: 8),
                                Text(
                                  name,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  category,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTemplateCard({
    required BuildContext context,
    required String name,
    required String templateId,
    required bool isSelected,
    required ResumeProvider provider,
  }) {
    return Card(
      elevation: isSelected ? 8 : 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.description, size: 48, color: Colors.grey),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              provider.changeTemplate(templateId);
              Navigator.pushNamed(context, '/builder');
            },
            child: Text(isSelected ? 'Selected' : 'Select'),
          ),
        ],
      ),
    );
  }
}
