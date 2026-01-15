import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/service/auth_service.dart';
import 'package:throw_delivery/core/storage/app_storage_functions.dart';
import 'package:throw_delivery/core/storage/auth_storage_functions.dart';
import 'package:throw_delivery/modules/splash_screen_module/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/exports/bloc_exports.dart';
import 'core/exports/repository_exports.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final AuthService authService = AuthService();
  await authService.initialize();
  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  const MyApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    final AuthStorageFunctions authStorageFunctions = AuthStorageFunctions();
    final DeliveryAgentRepository deliveryAgentRepository =
        DeliveryAgentRepository();
    final DeliveryRequestRepository deliveryRequestRepository =
        DeliveryRequestRepository();
    final FeedbackRepository feedbackRepository = FeedbackRepository();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: deliveryAgentRepository),
        RepositoryProvider.value(value: deliveryRequestRepository),
        RepositoryProvider.value(value: feedbackRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authService: authService,
              authStorageFunctions: authStorageFunctions,
              deliveryAgentRepository: deliveryAgentRepository,
            ),
          ),
          BlocProvider(create: (context) => DeliveryAgentProfileCubit()),
          BlocProvider(
            create: (context) => RegisterVehicleBloc(
              deliveryAgentRepository: deliveryAgentRepository,
            ),
          ),
          BlocProvider(
            create: (context) => LicenseUploadBloc(
              deliveryAgentRepository: deliveryAgentRepository,
            ),
          ),
          BlocProvider(
            create: (context) => DeliveryRequestCubit(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => ActiveDeliveryListCubit(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => PlaceBidBloc(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => BargainActionBloc(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => AgentDeliveryListCubit(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => DeliveryRequestDetailsCubit(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) => CompleteDeliveryBloc(
              deliveryRequestRepository: deliveryRequestRepository,
            ),
          ),
          BlocProvider(
            create: (context) =>
                FeedbacksCubit(feedbackRepository: feedbackRepository),
          ),
        ],
        child: MaterialApp(
          title: 'Throw',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF00BFFF),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF00BFFF),
              brightness: Brightness.dark,
              surface: const Color(0xFF0f1c23),
            ),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,
          home: const SplashScreenWrapper(),
        ),
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    // Dispatch check auth status event when the app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(const CheckAuthStatus());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final isLoggedIn = authState is Authenticated;
        final bool hasVehicleRegistered = authState is Authenticated
            ? authState.hasVehicleRegistered
            : false;
        final bool hasApproved = authState is Authenticated
            ? authState.hasApproved
            : false;
        final bool hasDocumentUploaded = authState is Authenticated
            ? authState.hasDocumentUploaded
            : false;

        // Show loading state while checking auth
        if (authState is AuthInitial || authState is AuthLoading) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        // Check if it's the first launch
        return FutureBuilder<bool>(
          future: AppStorageFunctions.getIntroScreenStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: const Center(child: CircularProgressIndicator()),
              );
            }

            final isFirstLaunch = snapshot.data ?? true;

            return SplashScreen(
              isFirstLaunch: isFirstLaunch,
              isLoggedIn: isLoggedIn,
              hasVehicleRegistered: hasVehicleRegistered,
              hasApproved: hasApproved,
              hasDocumentUploaded: hasDocumentUploaded,
            );
          },
        );
      },
    );
  }
}
