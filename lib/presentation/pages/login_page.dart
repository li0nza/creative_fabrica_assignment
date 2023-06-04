import 'package:creative_fabrica_assignment/presentation/bloc/login/login_cubit.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/login/login_state.dart';
import 'package:creative_fabrica_assignment/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Page containing all the elements needed for a complete [LoginPage].
/// The page includes a loader that shows while firebase logs in anonymously
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Calls [doAnonymousSignIn] as soon as possible to get data for the page.
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().doAnonymousSignIn(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Loading(message: 'Logging in...')),
                    ],
                  ),
              error: (error) => const ErrorWidget(),
              success: (user) => const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Loading(message: 'Successfully logged in anonymously...')),
                    ],
                  ),
              orElse: () => const ErrorWidget());
        },
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('Login failed.')),
        Center(
          child: TextButton.icon(
              onPressed: () {
                context.read<LoginCubit>().doAnonymousSignIn(context);
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry')),
        )
      ],
    );
  }
}
