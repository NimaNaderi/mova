import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';

import '../../../config/theme/app_colors.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: FractionalOffset.bottomLeft,
              end: FractionalOffset.center,
              colors: [
                Color(0xff181A20),
                Colors.white,
              ],
            ).createShader(bounds),
            blendMode: BlendMode.modulate,
            child: Image.asset(
              AppImagesRoute.homeTopHeaderImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Row(
              children: [
                SvgPicture.asset(AppImagesRoute.appLogo),
                const Spacer(),
                SvgPicture.asset(AppImagesRoute.iconSearch),
                const SizedBox(
                  width: 24,
                ),
                SvgPicture.asset(AppImagesRoute.iconBell),
              ],
            ),
          ),
          Positioned(
            bottom: 24.h,
            left: 24.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Strange 2',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: AppColors.white),
                ),
                 SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Action, Superhero, Science Fiction, ...',
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
                 SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(AppImagesRoute.iconPlay),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Play',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: AppColors.white, width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(AppImagesRoute.iconPlus),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'My List',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}