import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.signOut();
              if (context.mounted) Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero greeting card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70),
                  ),
                  Text(
                    'Todo List App',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A simple todo list app with authentication',
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Quick actions grid
            Text('Quick Actions', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _QuickActionCard(
                  icon: Icons.list_alt,
                  label: 'Task List',
                  onTap: () => Navigator.pushNamed(context, '/task_list_screen'),
                ),
                _QuickActionCard(
                  icon: Icons.dashboard,
                  label: 'Task Detail',
                  onTap: () => Navigator.pushNamed(context, '/task_detail_screen'),
                ),
                _QuickActionCard(
                  icon: Icons.edit_note,
                  label: 'Add/Edit Task',
                  onTap: () => Navigator.pushNamed(context, '/task_form_screen'),
                ),
                _QuickActionCard(
                  icon: Icons.edit_note,
                  label: 'Login',
                  onTap: () => Navigator.pushNamed(context, '/login_screen'),
                ),
                _QuickActionCard(
                  icon: Icons.edit_note,
                  label: 'Register',
                  onTap: () => Navigator.pushNamed(context, '/register_screen'),
                ),
                _QuickActionCard(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () => Navigator.pushNamed(context, '/settings_screen'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Task List',
          ),
          NavigationDestination(
            icon: Icon(Icons.widgets),
            label: 'Task Detail',
          ),
        ],
        onDestinationSelected: (index) {
          final routes = [
            '/home_screen',
            '/task_list_screen',
            '/task_detail_screen',
          ];
          if (index < routes.length) Navigator.pushNamed(context, routes[index]);
        },
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionCard({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: theme.colorScheme.primary),
              const SizedBox(height: 8),
              Text(label, style: theme.textTheme.bodyMedium, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
