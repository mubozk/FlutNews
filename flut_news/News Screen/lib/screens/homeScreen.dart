class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return home: Scaffold(
    backgroundColor: Colors.indigoAccent[100],
    appBar: AppBar(
    title: const Text('FlutNews', style: TextStyle(fontSize: 18)),
    backgroundColor: Colors.lightBlueAccent[100],
    centerTitle: true,
    ),
    body: InkWell(
    onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context){
    return NewScreen();
    },
    )
    },
    child: Container(
    color: containerColor,
    width: 400,
    height: 400,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(10),
    child: const Text(
    'Click on me to change my color!',
    style: TextStyle(fontSize: 20),
    )
    )
    ),
    ),;
  }
}
