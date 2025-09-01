import '../../../utils/common_import.dart';

class StatisticsScreen extends StatefulHookConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Statistics"),
      ),
    );
  }
}
