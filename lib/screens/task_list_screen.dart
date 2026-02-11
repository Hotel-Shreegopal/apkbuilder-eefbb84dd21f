import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Map<String, dynamic>> _items = [];
  bool _isLoading = true;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() => _isLoading = true);
    // TODO: Load from service
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _items = List.generate(10, (i) => {
        'title': 'Item ${i + 1}',
        'description': 'Description for item ${i + 1}',
      });
      _isLoading = false;
    });
  }

  List<Map<String, dynamic>> get _filteredItems {
    if (_searchQuery.isEmpty) return _items;
    return _items.where((item) {
      return item.values.any((v) =>
        v.toString().toLowerCase().contains(_searchQuery.toLowerCase()));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              onChanged: (v) => setState(() => _searchQuery = v),
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                isDense: true,
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadItems,
              child: _filteredItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox_outlined, size: 64, color: theme.colorScheme.outline),
                          const SizedBox(height: 16),
                          Text('No items found', style: theme.textTheme.bodyLarge),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = _filteredItems[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: theme.colorScheme.primaryContainer,
                              child: Text('${index + 1}', style: TextStyle(color: theme.colorScheme.onPrimaryContainer)),
                            ),
                            title: Text(item.values.first.toString()),
                            subtitle: item.values.length > 1 ? Text(item.values.elementAt(1).toString()) : null,
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              // Navigate to detail
                            },
                          ),
                        );
                      },
                    ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to form
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
    );
  }
}
