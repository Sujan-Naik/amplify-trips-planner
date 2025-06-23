import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_trips_planner/common/navigation/router/routes.dart';
import 'package:amplify_trips_planner/common/ui/bottomsheet_text_form_field.dart';
import 'package:amplify_trips_planner/common/utils/colors.dart' as constants;
import 'package:amplify_trips_planner/common/utils/date_time_formatter.dart';
import 'package:amplify_trips_planner/features/activity/controller/activity_controller.dart';
import 'package:amplify_trips_planner/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EditActivityPage extends ConsumerStatefulWidget {
  const EditActivityPage({
    required this.activity,
    super.key,
  });

  final Activity activity;

  @override
  EditActivityPageState createState() => EditActivityPageState();
}

class EditActivityPageState extends ConsumerState<EditActivityPage> {
  @override
  void initState() {
    activityNameController.text = widget.activity.activityName;
    activityDateController.text =
        widget.activity.activityDate.getDateTime().format('yyyy-MM-dd');

    activityTime =
        TimeOfDay.fromDateTime(widget.activity.activityTime!.getDateTime());
    activityTimeController.text =
        widget.activity.activityTime!.getDateTime().format('hh:mm a');

    activityCategoryController.text = widget.activity.category.name;

    activityCategory = widget.activity.category;

    super.initState();
  }

  final formGlobalKey = GlobalKey<FormState>();
  final activityNameController = TextEditingController();
  final activityDateController = TextEditingController();

  var activityTime = TimeOfDay.now();
  final activityTimeController = TextEditingController();

  final activityCategoryController = TextEditingController();

  var activityCategory = ActivityCategory.Flight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Trips Planner',
        ),
        leading: IconButton(
          onPressed: () {
            context.goNamed(
              AppRoute.activity.name,
              pathParameters: {'id': widget.activity.id},
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          child: Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 15,
            ),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetTextFormField(
                  labelText: 'Activity Name',
                  controller: activityNameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<ActivityCategory>(
                  onChanged: (value) {
                    activityCategoryController.text = value!.name;
                    activityCategory = value;
                  },
                  value: activityCategory,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                  ),
                  items: [
                    for (var category in ActivityCategory.values)
                      DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BottomSheetTextFormField(
                  labelText: 'Activity Date',
                  controller: activityDateController,
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.parse(
                          widget.activity.activityDate.toString()),
                      firstDate: DateTime.parse(
                          widget.activity.trip.startDate.toString()),
                      lastDate: DateTime.parse(
                          widget.activity.trip.endDate.toString()),
                    );

                    if (pickedDate != null) {
                      activityDateController.text =
                          pickedDate.format('yyyy-MM-dd');
                    } else {}
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BottomSheetTextFormField(
                  labelText: 'Activity Time',
                  controller: activityTimeController,
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: activityTime,
                      initialEntryMode: TimePickerEntryMode.dial,
                    ).then((timeOfDay) {
                      if (timeOfDay != null) {
                        final localizations = MaterialLocalizations.of(context);
                        final formattedTimeOfDay =
                        localizations.formatTimeOfDay(timeOfDay);

                        activityTimeController.text = formattedTimeOfDay;
                        activityTime = timeOfDay;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () async {
                    final currentState = formGlobalKey.currentState;
                    if (currentState == null) {
                      return;
                    }
                    if (currentState.validate()) {
                      final format = DateFormat.jm();

                      activityTime = TimeOfDay.fromDateTime(
                        format.parse(activityTimeController.text),
                      );

                      final now = DateTime.now();
                      final time = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        activityTime.hour,
                        activityTime.minute,
                      );

                      final updatedActivity = widget.activity.copyWith(
                        category: ActivityCategory.values
                            .byName(activityCategoryController.text),
                        activityName: activityNameController.text,
                        activityDate: TemporalDate(
                          DateTime.parse(activityDateController.text),
                        ),
                        activityTime: TemporalTime.fromString(
                          time.format('HH:mm:ss.sss'),
                        ),
                      );

                      await ref
                          .watch(
                        activityControllerProvider(widget.activity.id)
                            .notifier,
                      )
                          .updateActivity(updatedActivity);
                      if (context.mounted) {
                        context.goNamed(
                          AppRoute.activity.name,
                          pathParameters: {'id': widget.activity.id},
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}