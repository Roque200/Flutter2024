import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter, LengthLimitingTextInputFormatter, TextInputFormatter, TextInputType;

class RegistarScreen extends StatelessWidget {
  const RegistarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegistrationScreen();
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image;
  final _formKey = GlobalKey<FormState>();

  Future<void> _getImage() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: _getImage,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
          image: _image != null
              ? DecorationImage(
                  image: FileImage(File(_image!.path)),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _image == null
            ? Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.grey[700],
              )
            : null,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {TextInputType? keyboardType,
      bool obscureText = false,
      List<TextInputFormatter>? inputFormatters,
      String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
    );
  }

  Widget _buildRegistrationButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _registerUser();
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, 
        backgroundColor: Colors.amber, // Color del texto del botón
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), 
        ),
      ),
      child: Text(
        'Registrarse',
        style: TextStyle(fontSize: 18), 
      ),
    );
  }

  void _registerUser() {
    print('Nombre: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print('Contraseña: ${_passwordController.text}');
    print('Página de GitHub: ${_githubController.text}');
    print('Número de Teléfono: ${_phoneController.text}');
    if (_image != null) {
      print('Avatar: ${_image!.path}');
    } else {
      print('Avatar: No seleccionado');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      backgroundColor: Color.fromARGB(255, 122, 173, 3), 
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildAvatar(),
              SizedBox(height: 20),
              _buildTextField(
                _nameController,
                'Nombre Completo',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                _emailController,
                'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                _passwordController,
                'Contraseña',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                _githubController,
                'Página de GitHub',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su página de GitHub';
                  }
                  if (!Uri.parse(value).isAbsolute || !value.contains('github.com')) {
                    return 'Por favor ingrese una URL válida de GitHub';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              _buildTextField(
                _phoneController,
                'Número de Teléfono',
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su número de teléfono';
                  }
                  if (value.length != 10) {
                    return 'Por favor ingrese un número de teléfono válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _buildRegistrationButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: RegistarScreen(),
    ),
  ));
}
