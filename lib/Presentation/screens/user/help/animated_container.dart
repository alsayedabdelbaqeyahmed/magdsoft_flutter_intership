// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:maged_soft_test/Presentation/styles/colors.dart';
import 'package:maged_soft_test/Presentation/styles/fonts.dart';

class AnimatedContainerWidget extends StatefulWidget {
  final String? title;
  final String? content;
  bool? isExpanded;
  final BoxConstraints? size;

  AnimatedContainerWidget({
    super.key,
    required this.title,
    required this.content,
    this.isExpanded = true,
    required this.size,
  });

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: widget.size!.maxWidth * 0.0372,
        end: widget.size!.maxWidth * 0.0395,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: widget.size!.maxWidth * 0.923,
        height: widget.isExpanded!
            ? widget.size!.maxHeight * 0.0515
            : widget.size!.maxHeight * 0.1523,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: widget.size!.maxWidth * 0.03488,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title!,
                      style: AppFontStyle.textStyle(
                          color: AppColor.primaryColor,
                          size: widget.size!.maxHeight * 0.01824),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isExpanded = !widget.isExpanded!;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
                Text(
                  widget.content!,
                  style: AppFontStyle.textStyle(
                    color: AppColor.helpTextColor,
                    size: widget.size!.maxWidth * 0.0395,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
