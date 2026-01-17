import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/resources/colors/app_color_scheme.dart';
import '../../../../../../../core/resources/colors/app_colors.dart';
import '../../../../../../../core/resources/text/app_text_theme.dart';
import '../../../../../../../gen/assets.gen.dart';
import '../../../../../../chat/domain/models/e_chat_filter.dart';
import '../../bloc/chats_filter_bloc/chats_filter_bloc.dart';
import 'build_chat_filter_item/build_chat_filter_item.dart';

class ChatFilterUIData {
  final String icon;
  final String text;
  final EChatFilter filter;

  ChatFilterUIData({
    required this.icon,
    required this.text,
    required this.filter,
  });
}

class BuildChatFilters extends StatelessWidget {
  final Function(EChatFilter) onTapChatFilter;

  const BuildChatFilters({
    super.key,
    required this.onTapChatFilter,
  });

  @override
  Widget build(BuildContext context) {
    final chatFilterBloc = context.watch<ChatsFilterBloc>();
    final filter = chatFilterBloc.state.filter;
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return Wrap(
      spacing: 10.0,
      children:
          <ChatFilterUIData>[
                ChatFilterUIData(
                  icon: Assets.icons.time,
                  text: 'Recent',
                  filter: EChatFilter.recent,
                ),
                ChatFilterUIData(
                  icon: Assets.icons.time,
                  text: 'Unread',
                  filter: EChatFilter.unread,
                ),
                // BuildChatFilterItem(
                //   child: Row(
                //     children: [
                //
                //     ],
                //   ),
                //   isSelected: isSelected,
                // ),
              ]
              .map(
                (e) => BuildChatFilterItem(
                  isSelected: e.filter == filter,
                  onTap: () => onTapChatFilter(
                    e.filter,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        e.icon,
                        width: 15.0,
                        height: 15.0,
                        colorFilter: ColorFilter.mode(
                          e.filter == filter
                              ? AppColors.darkOrchid.value
                              : colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        e.text,
                        style: textTheme.bold14.copyWith(
                          color: e.filter == filter
                              ? AppColors.darkOrchid.value
                              : colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}
