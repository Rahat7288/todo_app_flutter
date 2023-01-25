// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchTerms;
  TodoSearchState({
    required this.searchTerms,
  });

  factory TodoSearchState.initial() {
    return TodoSearchState(searchTerms: '');
  }

  @override
  List<Object> get props => [searchTerms];

  @override
  bool get stringify => true;

  TodoSearchState copyWith({
    String? searchTerms,
  }) {
    return TodoSearchState(
      searchTerms: searchTerms ?? this.searchTerms,
    );
  }
}
