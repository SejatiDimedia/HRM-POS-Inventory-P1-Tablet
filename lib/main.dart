import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/attendance_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/auth_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/basic_salary_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/company_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/department_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/designation_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/holiday_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/leave_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/leave_type_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/payroll_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/permission_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/role_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/shift_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/staff_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/auth/blocs/login/login_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/auth/blocs/logout/logout_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/attendance/add_attendance/add_attendance_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/attendance/delete_attendance/delete_attendance_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/attendance/edit_attendance/edit_attendance_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/attendance/get_attendance/get_attendance_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/basic_salary/add_basic_salary/add_basic_salary_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/basic_salary/delete_basic_salary/delete_basic_salary_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/basic_salary/edit_basic_salary/edit_basic_salary_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/basic_salary/get_basic_salary/get_basic_salary_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/company/edit_company/edit_company_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/company/get_company/get_company_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/dashboard/pending_leave/pending_leave_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/dashboard/today_attendance/today_attendance_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/dashboard/today_summary/today_summary_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/department/department_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/designation/designation_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/holiday/holiday_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/leave/leave_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/leave_type/leave_type_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/payroll/delete_payroll/delete_payroll_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/payroll/generate_payroll/generate_payroll_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/payroll/get_payroll/get_payroll_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/payroll/get_payroll_detail/get_payroll_detail_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/permissions/get_all_permission/get_all_permission_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/role/role_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/shift/shift_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/staff/staff_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/colors.dart';
import 'data/data_source/dashboard_remote_data_source.dart';
import 'ui/auth/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => StaffBloc(StaffRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => DepartmentBloc(DepartmentRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => DesignationBloc(DesignationRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => ShiftBloc(ShiftRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => RoleBloc(RoleRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => HolidayBloc(HolidayRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LeaveBloc(LeaveRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LeaveTypeBloc(LeaveTypeRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GetAttendanceBloc(AttendanceRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AddAttendanceBloc(AttendanceRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => EditAttendanceBloc(AttendanceRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              DeleteAttendanceBloc(AttendanceRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              GetBasicSalaryBloc(BasicSalaryRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              AddBasicSalaryBloc(BasicSalaryRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              EditBasicSalaryBloc(BasicSalaryRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              DeleteBasicSalaryBloc(BasicSalaryRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GetCompanyBloc(CompanyRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => EditCompanyBloc(CompanyRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GetPayrollBloc(PayrollRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GetPayrollDetailBloc(PayrollRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GeneratePayrollBloc(PayrollRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => DeletePayrollBloc(PayrollRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => TodaySummaryBloc(DashboardRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => TodayAttendanceBloc(DashboardRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => PendingLeaveBloc(DashboardRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              GetAllPermissionBloc(PermissionRemoteDataSource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Intensive Club batch 20',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.background,
          dialogBackgroundColor: AppColors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.white,
          ),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: AppColors.white),
          dividerTheme: const DividerThemeData(color: AppColors.stroke),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
          ),
          listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
