import 'package:codesroots/features/doctor_api/presentation/bloc/doctor_cubit.dart';
import 'package:codesroots/features/home/presentation/pages/home_page.dart';
import 'package:codesroots/features/product_api/data/dataresources/graph_ql.dart';
import 'package:codesroots/features/product_api/presentation/bloc/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/bloc_observer.dart';
import 'features/doctor_api/data/dataresources/dio_helper.dart';

void main() {WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
   GetIt.instance.registerSingleton<GraphQl>(
      GraphQl());
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider(create: (BuildContext context) => DoctorCubit()),
         BlocProvider(create: (BuildContext context) => ProductsCubit()),
      ],
      child:  
        
        GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme:const AppBarTheme(
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black,
              
              ),
              
              centerTitle: true,
              backgroundColor: Colors.white
            ),
            primarySwatch: Colors.teal,
            useMaterial3: false,
            textTheme:  GoogleFonts.itimTextTheme(

            ).copyWith(
              titleMedium: const TextStyle(
                overflow: TextOverflow.ellipsis
              )
            )
          ),
          home: const HomeScreen(),
        ),
      
    );
  }
}
