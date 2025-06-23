import 'package:amplify_trips_planner/common/navigation/router/routes.dart';
import 'package:amplify_trips_planner/common/ui/bottomsheet_text_form_field.dart';
import 'package:amplify_trips_planner/common/utils/date_time_formatter.dart';
import 'package:amplify_trips_planner/features/activity/controller/activities_list_controller.dart';
import 'package:amplify_trips_planner/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddActivityForm extends ConsumerStatefulWidget {
  const AddActivityForm({
    required this.trip,
    super.key,
  });

  final AsyncValue<Trip> trip;

  @override
  AddActivityFormState createState() => AddActivityFormState();
}

class AddActivityFormState extends ConsumerState<AddActivityForm> {
  final formGlobalKey = GlobalKey<FormState>();

  final activityNameController = TextEditingController();
  final activityDateController = TextEditingController();
  final activityTimeController = TextEditingController();
  var activityCategory = ActivityCategory.Flight;
  var activityTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final activityNameController = TextEditingController();
    final activityDateController = TextEditingController();
    final activityTimeController = TextEditingController();
    var activityCategory = ActivityCategory.Flight;
    var activityTime = TimeOfDay.now();
    switch (widget.trip) {
      case AsyncData(:final value):
        return SingleChildScrollView(
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
                      activityCategory = value!;
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
                        initialDate: DateTime.parse(value.startDate.toString()),
                        firstDate: DateTime.parse(value.startDate.toString()),
                        lastDate: DateTime.parse(value.endDate.toString()),
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
                          final localizations =
                          MaterialLocalizations.of(context);
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
                        await ref
                            .watch(activitiesListControllerProvider(value.id)
                            .notifier)
                            .add(
                          name: activityNameController.text,
                          activityDate: activityDateController.text,
                          activityTime: activityTime,
                          category: activityCategory,
                          trip: value,
                        );
                        if (context.mounted) {
                          context.goNamed(
                            AppRoute.trip.name,
                            pathParameters: {'id': value.id},
                          );
                        }
                      }
                    }, //,
                  ),
                ],
              ),
            ),
          ),
        );

      case AsyncError():
        return const Center(
          child: Text('Error'),
        );
      case AsyncLoading():
        return const Center(
          child: CircularProgressIndicator(),
        );

      case _:
        return const Center(
          child: Text('Error'),
        );
    }
  }
}