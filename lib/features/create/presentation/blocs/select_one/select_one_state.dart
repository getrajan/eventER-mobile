part of 'select_one_cubit.dart';

class SelectOneState {
  final int currentCategoryIndex;
  final int currentTypeIndex;
  final String? category;
  final String? type;
  const SelectOneState(
      {required this.currentCategoryIndex,
      this.category,
      required this.currentTypeIndex,
      this.type});

  SelectOneState copyWith({
    int? currentCategoryIndex,
    int? currentTypeIndex,
    String? category,
    String? type,
  }) {
    return SelectOneState(
      currentCategoryIndex: currentCategoryIndex ?? this.currentCategoryIndex,
      currentTypeIndex: currentTypeIndex ?? this.currentTypeIndex,
      category: category ?? this.category,
      type: type ?? this.type,
    );
  }
}
