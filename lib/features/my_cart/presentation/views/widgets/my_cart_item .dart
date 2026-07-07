import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';

class MyCartItem extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const MyCartItem({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(product.id),

      // السحب من اليمين → أزرار الكمية فوق بعض
      startActionPane: ActionPane(
        motion: const ScrollMotion(),

        extentRatio: 0.20,
        children: [
          CustomSlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            child: Container(
              width: 58.w,
              height: 104.h,
              decoration: BoxDecoration(
                color: const Color(0xFF00C853),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // زر الزيادة
                  SizedBox(
                    height: 28.h,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: onIncrease,
                      iconSize: 20.r,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // رقم الكمية
                  Text(
                    quantity.toString(),
                    style: Styles.textStyle14W400Raleway.copyWith(
                      color: AppColors.backgroundColorItem,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // زر النقصان
                  SizedBox(
                    height: 28.h,
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: onDecrease,
                      iconSize: 20.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // السحب من اليسار → زر الحذف
      endActionPane: ActionPane(
        motion: const ScrollMotion(),

        extentRatio: 0.18,
        children: [
          Container(
            width: 58.w,
            height: 104.h,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: InkWell(
              onTap: onDelete,
              child: Center(
                child: SvgPicture.asset(
                  AssetsData.deleteIconSvg,
                  width: 18.w,
                  height: 20.h,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),

      // محتوى العنصر الأساسي
      child: Container(
        width: 375.w,
        height: 104.h,
        margin: const EdgeInsets.symmetric(horizontal: 10),

        decoration: BoxDecoration(
          color: AppColors.backgroundColorItem,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // صورة المنتج
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: const EdgeInsets.all(9),
                width: 87.w,
                height: 85.h,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  width: 69.r,
                  height: 69.r,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const Center(child: AppLoader()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            const SizedBox(width: 39),

            // تفاصيل المنتج
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Styles.textStyle13W500Raleway.copyWith(
                      color: AppColors.priceColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$${product.price.toString()}",
                    style: Styles.textStyle14W500Poppins.copyWith(
                      color: AppColors.priceColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';

// class MyCartItem extends StatefulWidget {
//   final ProductModel product;
//   final int quantity;
//   final VoidCallback onIncrease;
//   final VoidCallback onDecrease;
//   final VoidCallback onDelete;

//   const MyCartItem({
//     super.key,
//     required this.product,
//     required this.quantity,
//     required this.onIncrease,
//     required this.onDecrease,
//     required this.onDelete,
//   });

//   @override
//   State<MyCartItem> createState() => _MyCartItemState();
// }

// class _MyCartItemState extends State<MyCartItem>
//     with SingleTickerProviderStateMixin {
//   double _drag = 0;

//   double get _width => 335 - _drag.abs();

//   void _onHorizontalDragUpdate(DragUpdateDetails details) {
//     setState(() {
//       _drag += details.delta.dx;

//       if (_drag > 68) {
//         _drag = 68;
//       }

//       if (_drag < -68) {
//         _drag = -68;
//       }
//     });
//   }

//   void _onHorizontalDragEnd(DragEndDetails details) {
//     setState(() {
//       if (_drag.abs() < 34) {
//         _drag = 0;
//       } else {
//         _drag = _drag > 0 ? 68 : -68;
//       }
//     });
//   }

//   void _close() {
//     setState(() {
//       _drag = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onHorizontalDragUpdate: _onHorizontalDragUpdate,
//       onHorizontalDragEnd: _onHorizontalDragEnd,
//       child: SizedBox(
//         width: 335.w,
//         height: 104.h,
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Row(
//                 children: [
//                   Container(
//                     width: 68.w,
//                     decoration: BoxDecoration(
//                       color: const Color(0xff00C853),
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           onPressed: widget.onIncrease,
//                           icon: const Icon(Icons.add, color: Colors.white),
//                         ),
//                         Text(
//                           widget.quantity.toString(),
//                           style: Styles.textStyle14W400Raleway.copyWith(
//                             color: Colors.white,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: widget.onDecrease,
//                           icon: const Icon(Icons.remove, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     width: 68.w,
//                     decoration: BoxDecoration(
//                       color: Colors.redAccent,
//                       borderRadius: BorderRadius.circular(12.r),
//                     ),
//                     child: InkWell(
//                       onTap: widget.onDelete,
//                       child: Center(
//                         child: SvgPicture.asset(
//                           AssetsData.deleteIconSvg,
//                           width: 20.w,
//                           height: 20.h,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 150),
//               left: _drag > 0 ? _drag : 0,
//               right: _drag < 0 ? -_drag : 0,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 150),
//                 width: _width.w,
//                 height: 104.h,
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: AppColors.backgroundColorItem,
//                   borderRadius: BorderRadius.circular(8.r),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(.05),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                         width: 87.w,
//                         height: 85.h,
//                         padding: const EdgeInsets.all(9),
//                         decoration: BoxDecoration(
//                           color: AppColors.backgroundColor,
//                           borderRadius: BorderRadius.circular(16.r),
//                         ),
//                         child: CachedNetworkImage(
//                           imageUrl: widget.product.image,
//                           fit: BoxFit.contain,
//                           placeholder: (_, __) =>
//                               const Center(child: AppLoader()),
//                           errorWidget: (_, __, ___) => const Icon(Icons.error),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 39),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.product.title,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: Styles.textStyle13W500Raleway.copyWith(
//                               color: AppColors.priceColor,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Text(
//                             "\$${widget.product.price}",
//                             style: Styles.textStyle14W500Poppins.copyWith(
//                               color: AppColors.priceColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
