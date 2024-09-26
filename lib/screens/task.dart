import '../app_imports/app_constant_imports.dart';
import '../app_imports/app_default_imports.dart';

class NumberGridScreen extends StatefulWidget {
  const NumberGridScreen({super.key});

  @override
  State<NumberGridScreen> createState() => _NumberGridScreenState();
}

class _NumberGridScreenState extends State<NumberGridScreen> {
  String _selectedRule = 'Odd';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedRule = numbSystem[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: blueGrey,
        centerTitle: true,
        title: Text(
          'Number Grid App',
          style: Fonts().h1l(context).copyWith(
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  int number = index + 1;
                  bool isHighlighted = _isHighlighted(number, _selectedRule);

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isHighlighted ? colorsList[_selectedIndex] : grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      number.toString(),
                      style: Fonts().h3l(context).copyWith(
                        color: isHighlighted ? white : black,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: Fonts().h4l(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
                children: [
                  const TextSpan(
                    text: 'Colored numbers are ',
                  ),
                  TextSpan(
                    text: numbTitle[_selectedIndex],
                    style: Fonts().h3l(context).copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorsList[_selectedIndex],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            label: 'Odd',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            label: 'Even',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.military_tech_rounded),
            label: 'Prime',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Fibonacci',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorsList[_selectedIndex],
        unselectedItemColor: black,
        backgroundColor: red,
        onTap: _onItemTapped,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 20),
      ),
    );
  }

  // Determine if the number should be highlighted based on the selected rule
  bool _isHighlighted(int number, String rule) {
    switch (rule) {
      case 'Odd':
        return number % 2 != 0;
      case 'Even':
        return number % 2 == 0;
      case 'Prime':
        return _isPrime(number);
      case 'Fibonacci':
        return _isFibonacci(number);
      default:
        return false;
    }
  }

  // Prime number check
  bool _isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  // Fibonacci sequence check
  bool _isFibonacci(int number) {
    int a = 0, b = 1, temp;
    while (b < number) {
      temp = a;
      a = b;
      b = temp + b;
    }
    return b == number || number == 0;
  }
}
