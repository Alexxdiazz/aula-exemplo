import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool obscurePassword = true;

  void login() {
    String user = userController.text;
    String pass = passController.text;

    if (user.isEmpty || pass.isEmpty) {
      showMessage("rellenar todos los campos");
    } else if (user == "admin" && pass == "123") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: user),
        ),
      );
    } else {
      showMessage("Usuário o contraseña inválidos!");
    }
  }

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
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
                  labelText: "Contraseña",
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

  final nombreController = TextEditingController();
  final direccionController = TextEditingController();
  final cursoController = TextEditingController();
  final ciudadController = TextEditingController();
  final paisController = TextEditingController();

  void salvar() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Datos Salvos"),
          content: Text(
            "Nombre: ${nombreController.text}\n"
            "Direccion: ${direccionController.text}\n"
            "Curso: ${cursoController.text}\n"
            "Ciudad: ${ciudadController.text}\n"
            "País: ${paisController.text}",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
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
        title: Text("Bienvenido ${widget.username}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              Text(
                "Login Usuario",
                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 20),

              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: "Nombre"),
              ),

              TextField(
                controller: direccionController,
                decoration: InputDecoration(labelText: "Direccion"),
              ),

              TextField(
                controller: cursoController,
                decoration: InputDecoration(labelText: "Curso"),
              ),

              TextField(
                controller: ciudadController,
                decoration: InputDecoration(labelText: "Ciudad"),
              ),

              TextField(
                controller: paisController,
                decoration: InputDecoration(labelText: "País"),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: salvar,
                    child: Text("Salvar"),
                  ),
                  ElevatedButton(
                    onPressed: volver,
                    child: Text("Volver"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}