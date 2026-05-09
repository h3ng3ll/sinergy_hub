import 'package:flutter/material.dart';


import '../../../../../onboard_survey/domain/models/skill/skill.dart';
import '../../../tabs/profile_tab/widgets/build_skills_n_expertise/build_skill_item.dart';
import '../../../../../../core/widgets/inputs/skill_input.dart';

class BuildSkillsSection extends StatefulWidget {
  final Function(String) onSubmitSkill;
  final Function(Skill) onRemoveExistingSkill;
  final List<String> skills;
  final List<Skill> activeSkills;
  final bool isVisibleInput;

  const BuildSkillsSection({
    super.key,
    required this.onSubmitSkill,
    required this.onRemoveExistingSkill,
    required this.skills,
    required this.activeSkills,
    this.isVisibleInput = true,
  });

  @override
  State<BuildSkillsSection> createState() => _BuildSkillsSectionState();
}

class _BuildSkillsSectionState extends State<BuildSkillsSection>
    with WidgetsBindingObserver {
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _fieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  List<String> _currentOptions = const [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
    _controller.addListener(_onTextChanged);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _removeOverlay();
    _focusNode.removeListener(_onFocusChanged);
    _controller.removeListener(_onTextChanged);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // Triggered when keyboard appears/disappears — rebuild overlay so it
    // recalculates position relative to the new keyboard inset.
    if (_overlayEntry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _overlayEntry?.markNeedsBuild();
      });
    }
  }

  List<String> _filterOptions(String text) {
    if (text.isEmpty) return const [];
    final skills = [...widget.skills];
    final existsSkills = widget.activeSkills.map((e) => e.name).toList();
    skills.removeWhere((e) => existsSkills.contains(e));
    return skills
        .where(
          (skill) => skill.toLowerCase().startsWith(text.toLowerCase()),
        )
        .toList();
  }

  void _showOverlay() {
    if (_currentOptions.isEmpty) return;
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
      return;
    }

    _overlayEntry = OverlayEntry(builder: _buildOverlay);
    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildOverlay(BuildContext overlayContext) {
    final fieldBox =
        _fieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (fieldBox == null || !fieldBox.attached) {
      return const SizedBox.shrink();
    }
    final fieldSize = fieldBox.size;

    // Read raw window insets — Scaffold's resizeToAvoidBottomInset zeroes
    // out MediaQuery.viewInsets inside its body, so we must consult the
    // physical view directly to know the real keyboard height.
    final view = View.of(context);
    final devicePixelRatio = view.devicePixelRatio;
    final keyboardHeight = view.viewInsets.bottom / devicePixelRatio;
    final screenHeight = view.physicalSize.height / devicePixelRatio;
    final topPadding = view.padding.top / devicePixelRatio;

    final fieldOffset = fieldBox.localToGlobal(Offset.zero);
    final fieldBottom = fieldOffset.dy + fieldSize.height;
    final spaceBelow = screenHeight - keyboardHeight - fieldBottom;
    final spaceAbove = fieldOffset.dy - topPadding;

    final openUp = spaceBelow < 180 && spaceAbove > spaceBelow;
    final maxHeight = (openUp ? spaceAbove : spaceBelow).clamp(80.0, 220.0);

    return Positioned(
      width: fieldSize.width,
      child: CompositedTransformFollower(
        link: _layerLink,
        showWhenUnlinked: false,
        targetAnchor:
            openUp ? Alignment.topLeft : Alignment.bottomLeft,
        followerAnchor:
            openUp ? Alignment.bottomLeft : Alignment.topLeft,
        offset: Offset(0, openUp ? -4 : 4),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            constraints: BoxConstraints(maxHeight: maxHeight),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: _currentOptions.length,
              itemBuilder: (context, index) {
                final option = _currentOptions[index];
                return InkWell(
                  onTap: () => _onSelected(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onTextChanged() {
    final text = _controller.text;
    _currentOptions = _filterOptions(text);
    if (_currentOptions.isEmpty) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_currentOptions.isNotEmpty) _showOverlay();
      });
    } else {
      _removeOverlay();
    }
  }

  void _onSelected(String selection) {
    widget.onSubmitSkill(selection);
    _controller.clear();
    _currentOptions = const [];
    _removeOverlay();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 15.0,
          runSpacing: 10.0,
          children: widget.activeSkills
              .map(
                (skill) => BuildSkillItem(
                  onTap: () => widget.onRemoveExistingSkill(skill),
                  skill: skill,
                ),
              )
              .toList(),
        ),
        if (widget.isVisibleInput)
          CompositedTransformTarget(
            link: _layerLink,
            child: KeyedSubtree(
              key: _fieldKey,
              child: SkillInput(
                controller: _controller,
                focusNode: _focusNode,
                // Suppress the default unfocus-on-tap-outside behavior.
                // Without this, tapping a suggestion in the overlay would
                // unfocus the field, which fires _onFocusChanged and
                // removes the overlay before the InkWell.onTap runs.
                onTapOutside: (_) {},
                onFieldSubmitted: (_) {
                  final text = _controller.text.trim();
                  final isSuggestion = widget.skills.any(
                    (skill) =>
                        skill.toLowerCase() == text.toLowerCase(),
                  );
                  if (text.isNotEmpty && !isSuggestion) {
                    widget.onSubmitSkill(text);
                  }
                  _controller.clear();
                  _currentOptions = const [];
                  _removeOverlay();
                  _focusNode.unfocus();
                },
              ),
            ),
          ),
      ],
    );
  }
}
