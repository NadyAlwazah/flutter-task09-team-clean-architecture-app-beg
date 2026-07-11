import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_button.dart';

class CartCheckoutSection extends StatelessWidget {
  final double subtotal;
  final double delivery;
  final double total;

  const CartCheckoutSection({
    super.key,
    required this.subtotal,
    required this.delivery,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 34),
      decoration: const BoxDecoration(color: AppColors.backgroundColorItem),
      child: Column(
        children: [
          _buildRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 8),
          _buildRow('Delivery', '\$${delivery.toStringAsFixed(2)}'),
          const SizedBox(height: 16),

          DottedLine(
            dashLength: 6,
            dashGapLength: 6,
            lineThickness: 2,
            dashColor: AppColors.textSubTitle.withOpacity(0.5),
          ),

          const SizedBox(height: 16),
          _buildRow(
            'Total Cost',
            '\$${total.toStringAsFixed(2)}',
            labelColor: AppColors.appBarTitleColor,
            valueColor: AppColors.primary,
          ),

          const SizedBox(height: 30),
          CustomButton(text: 'Checkout', onPressed: () {}, radius: 12.r),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    Color? labelColor,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Styles.textStyle16W500Raleway.copyWith(
            color: labelColor ?? AppColors.textSubTitle,
          ),
        ),
        Text(
          value,
          style: Styles.textStyle16W500Poppins.copyWith(
            color: valueColor ?? AppColors.priceColor,
          ),
        ),
      ],
    );
  }
}
