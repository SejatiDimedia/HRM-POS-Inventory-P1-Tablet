import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../widgets/nav_item.dart';
import 'attendance_page.dart';
import 'dashboard_page.dart';
import 'departement_page.dart';
import 'designation_page.dart';
import 'holiday_page.dart';
import 'leaves_page.dart';
import 'payroll_page.dart';
import 'settings_page.dart';
import 'shift_page.dart';
import 'staff_member_page.dart';
import 'user_management_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      const HomePage(),
      const StaffMemberPage(),
      const UserManagementPage(),
      const DepartementPage(),
      const DesignationPage(),
      const ShiftPage(),
      const HolidayPage(),
      const LeavesPage(),
      const AttendancePage(),
      const PayrollPage(),
      const SettingsPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    border: Border(
                      right: BorderSide(color: AppColors.stroke),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceHeight(16.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Assets.images.logoPrimary.image(height: 70.0),
                      ),
                      const SpaceHeight(20.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'HR MASTER MANAGEMENT',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SpaceHeight(4.0),
                      NavItem(
                        label: 'Dashboard',
                        iconPath: Assets.icons.nav.dashboard.path,
                        isActive: _selectedIndex == 0,
                        onTap: () => _onItemTapped(0),
                      ),
                      NavItem(
                        label: 'Staff Member',
                        iconPath: Assets.icons.nav.staffMember.path,
                        isActive: _selectedIndex == 1,
                        onTap: () => _onItemTapped(1),
                      ),
                      NavItem(
                        label: 'User Management',
                        iconPath: Assets.icons.nav.userManagement.path,
                        isActive: _selectedIndex == 2,
                        onTap: () => _onItemTapped(2),
                      ),
                      NavItem(
                        label: 'Departments',
                        iconPath: Assets.icons.nav.departements.path,
                        isActive: _selectedIndex == 3,
                        onTap: () => _onItemTapped(3),
                      ),
                      NavItem(
                        label: 'Designations',
                        iconPath: Assets.icons.nav.designations.path,
                        isActive: _selectedIndex == 4,
                        onTap: () => _onItemTapped(4),
                      ),
                      NavItem(
                        label: 'Shifts',
                        iconPath: Assets.icons.nav.shifts.path,
                        isActive: _selectedIndex == 5,
                        onTap: () => _onItemTapped(5),
                      ),
                      NavItem(
                        label: 'Holidays',
                        iconPath: Assets.icons.nav.holidays.path,
                        isActive: _selectedIndex == 6,
                        onTap: () => _onItemTapped(6),
                      ),
                      NavItem(
                        label: 'Leaves',
                        iconPath: Assets.icons.nav.leaves.path,
                        isActive: _selectedIndex == 7,
                        onTap: () => _onItemTapped(7),
                      ),
                      NavItem(
                        label: 'Attendance',
                        iconPath: Assets.icons.nav.attendance.path,
                        isActive: _selectedIndex == 8,
                        onTap: () => _onItemTapped(8),
                      ),
                      NavItem(
                        label: 'Payroll',
                        iconPath: Assets.icons.nav.payroll.path,
                        isActive: _selectedIndex == 9,
                        onTap: () => _onItemTapped(9),
                      ),
                      NavItem(
                        label: 'Settings',
                        iconPath: Assets.icons.nav.settings.path,
                        isActive: _selectedIndex == 10,
                        onTap: () => _onItemTapped(10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
