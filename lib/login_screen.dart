import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p5/dashboard_screen.dart';
import 'package:p5/login_bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const LoginView(),
      create: (context) => LoginBloc(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: context.read<LoginBloc>().formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: context.read<LoginBloc>().email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukan email anda',
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Email diperlukan";
                  }

                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: context.read<LoginBloc>().password,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukan password anda',
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Password diperlukan";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(SubmitForm());
                },
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    }

                    if (state is LoginFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login tidak berhasil'),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      );
                    }
                    return Text('Login');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
