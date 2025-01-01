import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/dashboard/pending_leave/pending_leave_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/dashboard/today_attendance/today_attendance_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/dashboard/today_summary/today_summary_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../data/models/request/attendance_request_model.dart';
import '../../../data/models/request/leave_request_model.dart';

import '../blocs/attendance/edit_attendance/edit_attendance_bloc.dart';
import '../blocs/leave/leave_bloc.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/card_custom.dart';
import '../widgets/card_custom_time.dart';
import '../widgets/status_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final filterBy = [
    'Name',
    'Status',
  ];

  bool pendingApprovalEmpty = false;
  late String currentTime;
  Timer? timer;
  late AnimationController animationController;
  late Animation<Color?> colorTween;

  @override
  void initState() {
    context.read<TodaySummaryBloc>().add(const TodaySummaryEvent.fetch());
    context.read<TodayAttendanceBloc>().add(const TodayAttendanceEvent.fetch());
    context.read<PendingLeaveBloc>().add(const PendingLeaveEvent.fetch());
    currentTime = getCurrentTime();
    startTimer();
    setupBlinkAnimation();
    super.initState();
  }

  String getCurrentTime() {
    return DateFormat('hh : mm a').format(DateTime.now());
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = getCurrentTime();
      });
    });
  }

  void setupBlinkAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    colorTween = ColorTween(
      begin: AppColors.white,
      end: AppColors.red,
    ).animate(animationController);
  }

  @override
  void dispose() {
    timer?.cancel();
    animationController.dispose();
    super.dispose();
  }

  // Helper function to calculate time difference
  String getTimeDifference(DateTime clockinTime) {
    final now = DateTime.now();
    final difference = now.difference(clockinTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} mins ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          BlocBuilder<TodaySummaryBloc, TodaySummaryState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ),
                failed: (message) => Center(
                  child: Text(message),
                ),
                success: (data) {
                  return Row(
                    children: [
                      CardCustomTime(
                        title: 'Current Time',
                        subtitle: AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) {
                            final timeString = currentTime.substring(
                                0, currentTime.length - 2);
                            final amPmString =
                                currentTime.substring(currentTime.length - 2);

                            return RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: timeString,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: amPmString,
                                    style: TextStyle(
                                      color: colorTween.value,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );

                            // return Text(
                            //   currentTime,
                            //   style: TextStyle(
                            //     fontSize: 24.0,
                            //     fontWeight: FontWeight.w600,
                            //     color: colorTween.value,
                            //   ),
                            // );
                          },
                        ),
                        color: AppColors.yellow,
                      ),
                      const SpaceWidth(30.0),
                      CardCustom(
                        title: 'Present',
                        subtitle: data.totalPresent.toString(),
                        color: AppColors.green,
                      ),
                      const SpaceWidth(30.0),
                      CardCustom(
                        title: 'Leave',
                        subtitle: data.totalLeave.toString(),
                        color: AppColors.red,
                      ),
                      const SpaceWidth(30.0),
                      CardCustom(
                        title: 'Not Marked',
                        subtitle: data.totalNotMarked.toString(),
                        color: AppColors.blue,
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SpaceHeight(30.0),
          Card(
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today Attendance',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 130.0,
                        child: CustomDropdown(
                          value: filterBy.first,
                          items: filterBy,
                          label: 'Filter by',
                          onChanged: (value) {
                            setState(() {});
                          },
                          showLabel: false,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<TodayAttendanceBloc, TodayAttendanceState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ),
                      failed: (message) => Center(
                        child: Text(message),
                      ),
                      success: (data) {
                        if (data.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: EmptyPlaceholder(),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                final clockInTime = item.clockInDateTime;
                                return ListTile(
                                  leading: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${Variables.baseUrlImage}/${item.image}',
                                      height: 50.0,
                                      width: 50.0,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.person,
                                        color: AppColors.primary,
                                        size: 50,
                                      ),
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                  title: Text(item.userName ?? '-'),
                                  subtitle:
                                      Text(getTimeDifference(clockInTime!)),
                                  trailing: StatusWidget(item.status ?? ''),
                                );
                              });
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SpaceHeight(30.0),
          Card(
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pending Approvals',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 40.0,
                        child: Button.outlined(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {},
                          label: 'View All',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<PendingLeaveBloc, PendingLeaveState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      loading: () => const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ),
                      failed: (message) => Center(
                        child: Text(message),
                      ),
                      success: (data) {
                        if (data.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: EmptyPlaceholder(),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final item = data[index];

                                return ListTile(
                                  leading: ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${Variables.baseUrlImage}/${item.userPhoto}',
                                      height: 50.0,
                                      width: 50.0,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.person,
                                        color: AppColors.primary,
                                        size: 50,
                                      ),
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                      '${item.userName} (${item.startDate} - ${item.endDate})'),
                                  subtitle: Text(item.leaveTypeName ?? ''),
                                  trailing: SizedBox(
                                    width: 100, // Adjust width as needed
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BlocListener<LeaveBloc, LeaveState>(
                                          listener: (context, state) {
                                            state.maybeWhen(
                                              orElse: () {},
                                              failed: (message) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(message),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              },
                                              successEdit: (data) {
                                                context
                                                    .read<PendingLeaveBloc>()
                                                    .add(const PendingLeaveEvent
                                                        .fetch());
                                              },
                                            );
                                          },
                                          child: InkWell(
                                            onTap: () {
                                              final dataRequest =
                                                  LeaveRequestModel(
                                                userId: item.id,
                                                leaveTypeId: item.leaveTypeId,
                                                startDate: item.startDate,
                                                endDate: item.endDate,
                                                totalDays: item.totalDays,
                                                isHalfDay: item.isHalfDay == 1
                                                    ? true
                                                    : false,
                                                reason: item.reason,
                                                isPaid: item.isPaid == 1
                                                    ? true
                                                    : false,
                                                status: 'approved',
                                              );

                                              context.read<LeaveBloc>().add(
                                                  LeaveEvent.edit(
                                                      dataRequest, item.id!));

                                              final attendance =
                                                  AttendanceRequestModel(
                                                      userId: item.userId,
                                                      isLeave: true,
                                                      status: 'leave');
                                              context
                                                  .read<EditAttendanceBloc>()
                                                  .add(EditAttendanceEvent.edit(
                                                      attendance, item.id!));
                                            },
                                            child: const Icon(
                                              Icons.check_circle,
                                              color: AppColors.green,
                                            ),
                                          ),
                                        ),
                                        const SpaceWidth(20),
                                        BlocListener<LeaveBloc, LeaveState>(
                                          listener: (context, state) {
                                            state.maybeWhen(
                                              orElse: () {},
                                              failed: (message) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(message),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              },
                                              successEdit: (data) {
                                                context
                                                    .read<PendingLeaveBloc>()
                                                    .add(const PendingLeaveEvent
                                                        .fetch());
                                                context
                                                    .read<TodaySummaryBloc>()
                                                    .add(const TodaySummaryEvent
                                                        .fetch());
                                              },
                                            );
                                          },
                                          child: InkWell(
                                            onTap: () {
                                              final dataRequest =
                                                  LeaveRequestModel(
                                                userId: item.id,
                                                leaveTypeId: item.leaveTypeId,
                                                startDate: item.startDate,
                                                endDate: item.endDate,
                                                totalDays: item.totalDays,
                                                isHalfDay: item.isHalfDay == 1
                                                    ? true
                                                    : false,
                                                reason: item.reason,
                                                isPaid: item.isPaid == 1
                                                    ? true
                                                    : false,
                                                status: 'rejected',
                                              );

                                              context.read<LeaveBloc>().add(
                                                  LeaveEvent.edit(
                                                      dataRequest, item.id!));
                                              context
                                                  .read<TodaySummaryBloc>()
                                                  .add(const TodaySummaryEvent
                                                      .fetch());
                                            },
                                            child: const Icon(
                                              Icons.cancel_rounded,
                                              color: AppColors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
