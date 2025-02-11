import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pos_app/features/app/presentation/blocs/app_bloc/app_bloc.dart';
import 'package:pos_app/features/app/presentation/blocs/language_bloc.dart';
import 'package:pos_app/features/app/presentation/blocs/theme_bloc.dart';

class ServiceProvider extends StatelessWidget {
  final Widget child;
  const ServiceProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // PurchaseInvoiceBloc

        // BlocProvider(create: (BuildContext context) => GetIt.I<AuthBloc>()),
        // BlocProvider(create: (BuildContext context) => GetIt.I<HomeBloc>()),
        BlocProvider(create: (BuildContext context) => GetIt.I<LanguageBloc>()),
        BlocProvider(create: (BuildContext context) => GetIt.I<AppBloc>()),

        BlocProvider(create: (BuildContext context) => GetIt.I<ThemeBloc>()),
      ],
      child: child,
    );
  }
}
