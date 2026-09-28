import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/validators.dart';
import '../../widgets/auth_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  bool _loading = false;
  bool _sent = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      //   .sendPasswordResetEmail(email: _email.text.trim());
      await Future.delayed(const Duration(milliseconds: 800)); // dummy
      if (mounted) setState(() => _sent = true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Could not send email: $e')));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      showBack: true,
      title: 'Reset password',
      subtitle: "Enter your email and we'll send you a reset link.",
      child: _sent
          ? Column(
        children: [
          const Icon(Icons.mark_email_read_outlined,
              size: 64, color: Colors.green),
          const SizedBox(height: 12),
          Text('Check ${_email.text.trim()} for a reset link.',
              textAlign: TextAlign.center),
          const SizedBox(height: 24),
          PrimaryButton(
              label: 'Back to login', onPressed: () => context.pop()),
        ],
      )
          : Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              controller: _email,
              label: 'Email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: Validators.email,
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
                label: 'Send reset link',
                onPressed: _submit,
                loading: _loading),
          ],
        ),
      ),
    );
  }
}