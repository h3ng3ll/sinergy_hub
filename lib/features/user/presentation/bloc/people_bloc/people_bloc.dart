// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import '../../../domain/models/user_data/user_data.dart';
// import '../../../domain/usecases/get_user_use_case.dart';
// import '../../../domain/usecases/get_users_use_case.dart';
//
// part 'people_event.dart';
//
// part 'people_state.dart';
//
// part 'people_bloc.freezed.dart';
//
// class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
//   final GetUserUseCase _getUserUseCase;
//   final GetUsersUseCase _getUsersUseCase;
//
//   PeopleBloc({
//     required GetUserUseCase getUserUseCase,
//     required GetUsersUseCase getUsersUseCase,
//   }) : _getUserUseCase = getUserUseCase,
//        _getUsersUseCase = getUsersUseCase,
//        super(const PeopleState()) {
//     on<_GetUser>(_getUser);
//     on<_LoadAll>(_loadAll);
//   }
//
//   void _getUser(
//     _GetUser event,
//     Emitter<PeopleState> emit,
//   ) async {
//     try {
//       emit(
//         state.copyWith(
//           status: PeopleStatus.loading,
//         ),
//       );
//       final user = await _getUserUseCase(
//         id: event.uid,
//       );
//       if (user != null) {
//         emit(
//           state.copyWith(
//             status: PeopleStatus.initial,
//             users: {
//               ...state.users,
//               user.uid: user,
//             },
//           ),
//         );
//       } else {
//         emit(
//           state.copyWith(
//             status: PeopleStatus.failed,
//             errorMessage: 'User not found',
//           ),
//         );
//       }
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: PeopleStatus.failed,
//           errorMessage: e.toString(),
//         ),
//       );
//       rethrow;
//     }
//   }
//
//   void _loadAll(
//     _LoadAll event,
//     Emitter<PeopleState> emit,
//   ) async {
//     try {
//       emit(
//         state.copyWith(
//           status: PeopleStatus.loading,
//         ),
//       );
//       final users = await _getUsersUseCase.call(
//         ids: event.uids,
//       );
//
//       emit(
//         state.copyWith(
//           users: {
//             ...state.users,
//             for (UserData user in users) user.uid: user,
//           },
//           status: PeopleStatus.initial,
//         ),
//       );
//     } catch (e) {
//       emit(
//         state.copyWith(
//           status: PeopleStatus.failed,
//           errorMessage: e.toString(),
//         ),
//       );
//       rethrow;
//     }
//   }
// }
