import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool obscurePassword = true;

  final String usuarioCorreto = "abcde";
  final String contrasenaCorreta = "123";

  void login() {
    String user = userController.text;
    String pass = passController.text;

    if (user == usuarioCorreto && pass == contrasenaCorreta) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: user),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuário o contraseña incorretos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                backgroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/256/709/709722.png",
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: userController,
              decoration: InputDecoration(
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: passController,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelText: "Contrasena",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String username;

  HomePage({required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nombre = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController curso = TextEditingController();
  TextEditingController ciudad = TextEditingController();
  TextEditingController pais = TextEditingController();

  void salvar() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Datos Salvos"),
          content: Text(
            "Nombre: ${nombre.text}\n"
            "Direccion: ${direccion.text}\n"
            "Curso: ${curso.text}\n"
            "Ciudad: ${ciudad.text}\n"
            "País: ${pais.text}",
          ),
          actions: [
            TextButton(
              onPressed: (){
               Navigator.pop(context);
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  void volver() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              "Bienvenido ${widget.username}",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            TextField(controller: nombre, decoration: InputDecoration(labelText: "Nombre")),
            TextField(controller: direccion, decoration: InputDecoration(labelText: "Direccion")),
            TextField(controller: curso, decoration: InputDecoration(labelText: "Curso")),
            TextField(controller: ciudad, decoration: InputDecoration(labelText: "Ciudad")),
            TextField(controller: pais, decoration: InputDecoration(labelText: "País")),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: salvar,
              child: Text("Salvar"),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: volver,
              child: Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}
