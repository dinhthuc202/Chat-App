import 'package:flutter/material.dart';
import 'package:messenger/common/app_text_style.dart';

Widget Stories(String name,String srcImage){
  return Flexible(
    child: SizedBox(
      width: 56,
      height: 76,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFD2D5F9), Color(0xFF2C37E1)], // Màu sắc của gradient
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Image.network(
                      srcImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4,),
          Text(
            name,
            style: AppTextStyle.primaryS10W400,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    ),
  );
}