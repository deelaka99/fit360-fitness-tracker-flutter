import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  int _waterIntake = 1500; // ml
  final int _waterGoal = 3000;

  void _addWater(int amount) {
    setState(() {
      _waterIntake = (_waterIntake + amount).clamp(0, 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = _waterIntake / _waterGoal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hydration Tracker'),
        centerTitle: true,
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    value: progress,
                    color: Colors.blue,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    strokeWidth: 20,
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.water_drop, size: 48, color: Colors.blue),
                    const SizedBox(height: 8),
                    Text(
                      '${(_waterIntake / 1000).toStringAsFixed(1)}L',
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'of ${(_waterGoal / 1000).toStringAsFixed(1)}L',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              'Quick Add',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAddButton(context, 250, Icons.local_drink),
                _buildAddButton(context, 500, Icons.opacity),
              ],
            ),
            const SizedBox(height: 48),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Icon(Icons.info_outline, color: Colors.blue),
                  const SizedBox(height: 8),
                  Text(
                    'Did you know? Staying hydrated improves focus, metabolism, and physical performance.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, int amount, IconData icon) {
    return InkWell(
      onTap: () => _addWater(amount),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.blue.withOpacity(0.3), width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              '+${amount}ml',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
