// banner_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saheel_machine_test/repository/banner_repository.dart';
import 'package:saheel_machine_test/model/banner_model.dart';

abstract class BannerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBanners extends BannerEvent {}

// States
abstract class BannerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BannerInitial extends BannerState {}
class BannerLoading extends BannerState {}
class BannerLoaded extends BannerState {
  final List<BannerModel> banners; // Use your BannerModel

  BannerLoaded(this.banners);

  @override
  List<Object?> get props => [banners];
}
class BannerError extends BannerState {
  final String message;

  BannerError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc(this.bannerRepository) : super(BannerInitial()) {
    on<FetchBanners>((event, emit) async {
      emit(BannerLoading());
      try {
        final banners = await bannerRepository.fetchBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError(e.toString())); // Emit error message
      }
    });
  }
}
