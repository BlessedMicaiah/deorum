import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deorum/presentation/providers/auth_provider.dart';
import 'package:deorum/presentation/routes/app_routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _error = null;
                      });
                      try {
                        await context.read<AuthProvider>().signup(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.social);
                      } catch (e) {
                        setState(() => _error = e.toString());
                      } finally {
                        setState(() => _loading = false);
                      }
                    },
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.login),
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
