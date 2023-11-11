import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/export.dart';
import 'controller.dart';

class Home extends GetWidget<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CustomContainer(
              height: 812.height,
              image: ImageConstant.background,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper: CustomPath(),
                    child: CustomContainer(
                      width: 220.width,
                      height: 60.height,
                      alignment: Alignment.centerLeft,
                      color: AppColors.white,
                      child: ClipPath(
                        clipper: CustomPath(),
                        child: CustomContainer(
                          width: 216.width,
                          height: 60.height,
                          alignment: Alignment.centerLeft,
                          color: AppColors.dodgerBlue,
                          padding: EdgeInsets.symmetric(horizontal: 16.width),
                          child: Text(
                            'Hotels Search',
                            style: TextStyle(
                              fontSize: 18.fontSize,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.height),
                  CustomContainer(
                    color: AppColors.carrotOrange,
                    borderRadius: BorderRadius.circular(16.width),
                    child: Column(
                      children: [
                        CustomContainer(
                          borderRadius: BorderRadius.circular(16.width),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.width,
                            vertical: 8.width,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment(-1.0, 0.0),
                            end: Alignment(1.0, 0.0),
                            colors: [Color(0xff1275bb), Color(0xff50b6fd)],
                            stops: [0.0, 1.0],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 12.height),
                              CustomContainer(
                                padding: EdgeInsets.all(4.width),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16.width),
                                child: CustomTextFormField(
                                  hintText: 'Select City',
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 12.height),
                              CustomContainer(
                                padding: EdgeInsets.all(4.width),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16.width),
                                child: CustomContainer(
                                  padding: EdgeInsets.all(4.width),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16.width),
                                  border: Border.all(
                                    color: AppColors.dodgerBlue,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 120.width,
                                        child: CustomTextFormField(
                                          readOnly: true,
                                          label: const Text('From: '),
                                          border: InputBorder.none,
                                          controller: controller.from,
                                          enabledBorder: InputBorder.none,
                                          onTap: () {
                                            Pickers.date(context).then((date) {
                                              if (date != null) {
                                                controller.from.text =
                                                    date.format();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40.height,
                                        child: VerticalDivider(
                                          color: AppColors.dodgerBlue,
                                          thickness: 2,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120.width,
                                        child: CustomTextFormField(
                                          readOnly: true,
                                          label: const Text('To'),
                                          border: InputBorder.none,
                                          controller: controller.to,
                                          enabledBorder: InputBorder.none,
                                          onTap: () async {
                                            Pickers.date(context).then((date) {
                                              if (date != null) {
                                                controller.to.text =
                                                    date.format();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.clear,
                                          color: AppColors.dodgerBlue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.height),
                              CustomContainer(
                                padding: EdgeInsets.all(4.width),
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16.width),
                                child: CustomContainer(
                                  padding: EdgeInsets.all(4.width),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16.width),
                                  border: Border.all(
                                    color: AppColors.dodgerBlue,
                                  ),
                                  child: Obx(
                                    () => CustomDropdownButton(
                                      hint: 'Select Nationality',
                                      value: controller.nationality.value,
                                      items: controller
                                          .model.value.nationalities
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged:
                                          controller.onChangedNationality,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12.height),
                              Obx(
                                () => CustomContainer(
                                  padding: EdgeInsets.all(4.width),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16.width),
                                  child: CustomTextFormField(
                                    readOnly: true,
                                    icon: Icons.arrow_drop_down,
                                    hintText:
                                        '${controller.rooms.value} Rooms, ${controller.adults.value} Adults, ${controller.childrens.value} Children',
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(24.width),
                                            topLeft: Radius.circular(24.width),
                                          ),
                                        ),
                                        backgroundColor:
                                            const Color(0xFFEBECED),
                                        builder: (context) {
                                          return FractionallySizedBox(
                                            heightFactor: 0.9,
                                            child: Column(
                                              children: [
                                                CustomContainer(
                                                  width: artboardWidth.width,
                                                  height: 80.height,
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        24.width),
                                                    topLeft: Radius.circular(
                                                        24.width),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Spacer(),
                                                      const Text(
                                                          'Rooms and Guests'),
                                                      const Spacer(),
                                                      IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.clear),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                16.width),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                            height: 16.width),
                                                        CustomContainer(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal:
                                                                16.width,
                                                            vertical: 8.width,
                                                          ),
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.width),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Rooms',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.width,
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              SizedBox(
                                                                width:
                                                                    180.width,
                                                                child: Obx(
                                                                  () =>
                                                                      CustomTextFormField(
                                                                    hintText:
                                                                        '${controller.rooms}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    fontSize: 28
                                                                        .width,
                                                                    prefixIcon:
                                                                        Steppers(
                                                                      icon: Icons
                                                                          .remove,
                                                                      onPressed:
                                                                          controller
                                                                              .roomDecrement,
                                                                    ),
                                                                    suffixIcon:
                                                                        Steppers(
                                                                      icon: Icons
                                                                          .add,
                                                                      onPressed:
                                                                          controller
                                                                              .roomIncrement,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: 16.width),
                                                        CustomContainer(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal:
                                                                16.width,
                                                            vertical: 8.width,
                                                          ),
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.width),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                  'Room 1'),
                                                              SizedBox(
                                                                  height:
                                                                      16.width),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'Adults',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.width,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width: 180
                                                                        .width,
                                                                    child: Obx(
                                                                      () =>
                                                                          CustomTextFormField(
                                                                        hintText:
                                                                            '${controller.adults}',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        border:
                                                                            InputBorder.none,
                                                                        enabledBorder:
                                                                            InputBorder.none,
                                                                        fontSize:
                                                                            28.width,
                                                                        prefixIcon:
                                                                            Steppers(
                                                                          icon:
                                                                              Icons.remove,
                                                                          onPressed:
                                                                              controller.adultsDecrement,
                                                                        ),
                                                                        suffixIcon:
                                                                            Steppers(
                                                                          icon:
                                                                              Icons.add,
                                                                          onPressed:
                                                                              controller.adultsIncrement,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height:
                                                                      16.width),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'Children',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.width,
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  SizedBox(
                                                                    width: 180
                                                                        .width,
                                                                    child: Obx(
                                                                      () =>
                                                                          CustomTextFormField(
                                                                        hintText:
                                                                            '${controller.childrens}',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        border:
                                                                            InputBorder.none,
                                                                        enabledBorder:
                                                                            InputBorder.none,
                                                                        fontSize:
                                                                            28.width,
                                                                        prefixIcon:
                                                                            Steppers(
                                                                          icon:
                                                                              Icons.remove,
                                                                          onPressed:
                                                                              controller.childrensDecrement,
                                                                        ),
                                                                        suffixIcon:
                                                                            Steppers(
                                                                          icon:
                                                                              Icons.add,
                                                                          onPressed:
                                                                              controller.childrensIncrement,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const ListTile(
                                                                title: Text(
                                                                    'Age of Child 1'),
                                                                trailing: Text(
                                                                    '14 Years'),
                                                              ),
                                                              const ListTile(
                                                                title: Text(
                                                                    'Age of Child 2'),
                                                                trailing: Text(
                                                                    '14 Years'),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: 16.width),
                                                        CustomContainer(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal:
                                                                16.width,
                                                            vertical: 8.width,
                                                          ),
                                                          color:
                                                              AppColors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.width),
                                                          child: ListTile(
                                                            title: const Wrap(
                                                              children: [
                                                                Text(
                                                                    'Pet-Friendly'),
                                                                Icon(Icons.info)
                                                              ],
                                                            ),
                                                            subtitle: const Text(
                                                                'Only show stays thats allow pets'),
                                                            trailing: Obx(
                                                              () =>
                                                                  CupertinoSwitch(
                                                                value:
                                                                    controller
                                                                        .switchs
                                                                        .value,
                                                                onChanged:
                                                                    controller
                                                                        .onChangedSwitch,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: 16.width),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.width),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      minimumSize: Size(
                                                          artboardWidth.width,
                                                          60),
                                                    ),
                                                    child: const Text('Apply'),
                                                  ),
                                                ),
                                                SizedBox(height: 16.width),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.height),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: Size(artboardWidth.width, 58),
                            maximumSize: Size(artboardWidth.width, 58),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.width),
                                bottomRight: Radius.circular(16.width),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Find Hotels',
                                style: TextStyle(
                                  fontSize: 20.fontSize,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(width: 8.width),
                              Icon(
                                Icons.search,
                                size: 28.height,
                                color: AppColors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24.height),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
