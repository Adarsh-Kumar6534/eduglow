import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'dashboard.dart';

void main() {
  runApp(const EduGlowApp());
}

class EduGlowApp extends StatelessWidget {
  const EduGlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduGlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => DashboardPage(firstName: 'Student'),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _submit() {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        if (_emailController.text != 'student@eduglow.com' ||
            _passwordController.text != 'demo123') {
          _errorMessage = 'Invalid email or password';
        } else {
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(20, 20, 40, 1),
                  Color.fromRGBO(30, 30, 50, 1),
                  Color.fromRGBO(40, 30, 60, 1),
                  Color.fromRGBO(30, 30, 50, 1),
                  Color.fromRGBO(20, 20, 40, 1),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.25,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(147, 51, 234, 0.1),
              ),
            ).animate(
              effects: [
                MoveEffect(
                  duration: 20.seconds,
                  curve: Curves.easeInOut,
                  begin: const Offset(-20, -20),
                  end: const Offset(20, 20),
                ),
                BlurEffect(
                  begin: const Offset(0, 0),
                  end: const Offset(20, 20),
                  duration: 1.seconds,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            left: MediaQuery.of(context).size.width * 0.75,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(6, 182, 212, 0.1),
              ),
            ).animate(
              effects: [
                RotateEffect(
                  duration: 25.seconds,
                  curve: Curves.linear,
                ),
                BlurEffect(
                  begin: const Offset(0, 0),
                  end: const Offset(20, 20),
                  duration: 1.seconds,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.50,
            left: MediaQuery.of(context).size.width * 0.66,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(236, 72, 153, 0.1),
              ),
            ).animate(
              effects: [
                MoveEffect(
                  duration: 15.seconds,
                  curve: Curves.easeInOut,
                  begin: const Offset(0, -10),
                  end: const Offset(0, 10),
                ),
                BlurEffect(
                  begin: const Offset(0, 0),
                  end: const Offset(20, 20),
                  duration: 1.seconds,
                ),
              ],
            ),
          ),
          Center(
            child: GlassmorphicContainer(
              width: 448,
              height: MediaQuery.of(context).size.height * 0.85,
              borderRadius: 16,
              blur: 20,
              alignment: Alignment.center,
              border: 1,
              linearGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.12),
                  Colors.white.withOpacity(0.12),
                ],
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.15),
                  Colors.white.withOpacity(0.15),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF8B5CF6),
                                  Color(0xFF06B6D4),
                                ],
                              ),
                            ),
                          ).animate().scale(
                                duration: 0.8.seconds,
                                delay: 0.2.seconds,
                                curve: Curves.bounceOut,
                              ),
                          const Icon(
                            Icons.school,
                            size: 32,
                            color: Colors.white,
                          ),
                          Positioned(
                            top: -4,
                            right: -4,
                            child: const Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xFFFACC15),
                            ).animate().rotate(
                                  duration: 8.seconds,
                                  curve: Curves.linear,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFF8B5CF6),
                            Color(0xFF06B6D4),
                            Color(0xFFEC4899),
                          ],
                        ).createShader(bounds),
                        child: const Text(
                          'EduGlow',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ).animate().fadeIn(
                            duration: 0.8.seconds,
                            delay: 0.3.seconds,
                          ),
                      const SizedBox(height: 8),
                      const Text(
                        'Sign in to your learning journey',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFD1D5DB),
                        ),
                      ).animate().fadeIn(
                            duration: 0.8.seconds,
                            delay: 0.4.seconds,
                          ),
                      const SizedBox(height: 32),
                      if (_errorMessage != null)
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF4444).withOpacity(0.1),
                            border: Border.all(
                              color: const Color(0xFFEF4444).withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Color(0xFFFCA5A5),
                              fontSize: 14,
                            ),
                          ),
                        ).animate().slideX(
                              begin: -0.5,
                              end: 0,
                              duration: 0.5.seconds,
                            ),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.mail,
                                size: 16,
                                color: Color(0xFF9CA3AF),
                              ),
                              hintText: 'student@eduglow.com',
                              hintStyle: const TextStyle(
                                color: Color(0xFF9CA3AF),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.08),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFF8B5CF6),
                                ),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ).animate().slideX(
                            begin: -0.5,
                            end: 0,
                            duration: 0.5.seconds,
                            delay: 0.5.seconds,
                          ),
                      const SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 16,
                                color: Color(0xFF9CA3AF),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 16,
                                  color: const Color(0xFF9CA3AF),
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                              hintText: '••••••••',
                              hintStyle: const TextStyle(
                                color: Color(0xFF9CA3AF),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.08),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color(0xFF8B5CF6),
                                ),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ).animate().slideX(
                            begin: -0.5,
                            end: 0,
                            duration: 0.5.seconds,
                            delay: 0.6.seconds,
                          ),
                      const SizedBox(height: 24),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF8B5CF6),
                              Color(0xFF06B6D4),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8B5CF6).withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            minimumSize: const Size(double.infinity, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isLoading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Signing in...',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              : const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: 0.8.seconds,
                            delay: 0.7.seconds,
                          )
                          .slideY(
                            begin: 20.0,
                            end: 0.0,
                            duration: 0.8.seconds,
                            delay: 0.7.seconds,
                            curve: const Cubic(0.25, 0.46, 0.45, 0.94),
                          ),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'Demo Credentials:',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Email: student@eduglow.com',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFD1D5DB),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Password: demo123',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFD1D5DB),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(
                            duration: 0.8.seconds,
                            delay: 0.8.seconds,
                          ),
                      const SizedBox(height: 32),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '© 2024 EduGlow. Illuminate your learning path.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ).animate().fadeIn(
                            duration: 0.8.seconds,
                            delay: 0.9.seconds,
                          ),
                    ],
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(
                  duration: 0.8.seconds,
                  curve: const Cubic(0.25, 0.46, 0.45, 0.94),
                )
                .slideY(
                  begin: 20.0,
                  end: 0.0,
                  duration: 0.8.seconds,
                  curve: const Cubic(0.25, 0.46, 0.45, 0.94),
                )
                .scale(
                  begin: const Offset(0.95, 0.95),
                  end: const Offset(1.0, 1.0),
                  duration: 0.8.seconds,
                  curve: const Cubic(0.25, 0.46, 0.45, 0.94),
                ),
          ),
          Positioned(
            top: -8,
            left: -8,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: const Color(0xFF8B5CF6).withOpacity(0.5),
                    width: 2,
                  ),
                  left: BorderSide(
                    color: const Color(0xFF8B5CF6).withOpacity(0.5),
                    width: 2,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                ),
              ),
            ),
          ),
          Positioned(
            top: -8,
            right: -8,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: const Color(0xFF06B6D4).withOpacity(0.5),
                    width: 2,
                  ),
                  right: BorderSide(
                    color: const Color(0xFF06B6D4).withOpacity(0.5),
                    width: 2,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -8,
            left: -8,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFFEC4899).withOpacity(0.5),
                    width: 2,
                  ),
                  left: BorderSide(
                    color: const Color(0xFFEC4899).withOpacity(0.5),
                    width: 2,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -8,
            right: -8,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFF8B5CF6).withOpacity(0.5),
                    width: 2,
                  ),
                  right: BorderSide(
                    color: const Color(0xFF8B5CF6).withOpacity(0.5),
                    width: 2,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
