import 'package:ecommerce/domain/models/product_models/video_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../config/urls.dart';
import '../../../data/network/remote/dio_helper.dart';
import '../../../domain/models/product_models/product_galery_model.dart';

part 'product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  // get product Gallery:

  ProductGalleryModel productGalleryModel = ProductGalleryModel();
  List<String> gallery = [];

  getProductGallery({
    required String proId,
  }) {
    emit(GetProductGalleryLoadingState());

    if (gallery.isNotEmpty) {
      emit(GetProductGalleryDoneState());
    } else {
      DioHelper.getData(
        url: Urls.getGalleryProduct + proId,
      ).then((value) {
        productGalleryModel = ProductGalleryModel.fromJson(value.data);
        if (value.data['status']) {
          if (productGalleryModel.data?.gallery?.gallery != null) {
            if (productGalleryModel.data!.gallery!.gallery!.isNotEmpty) {
              gallery = productGalleryModel.data!.gallery!.gallery!;
              emit(GetProductGalleryDoneState());
            }
          }
        }
      }).catchError((err) {
        print(err.toString());
        emit(GetProductGalleryErrorState());
      });
    }
  }

  // Get Video of Product:

  VideoModel? videoModel = VideoModel();
  String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  getVideoOfProduct({
    required String proId,
  }) {
    emit(GetProductVideoLoadingState());

    DioHelper.getData(
      url: Urls.getVideoProduct + proId,
    ).then((value) {
      if (value.data['status']) {
        videoModel = VideoModel.fromJson(value.data);
        if (videoModel?.data?.video?.mainVideo != null) {
          if (videoModel!.data!.video!.mainVideo!.isNotEmpty) {
            videoUrl = videoModel!.data!.video!.mainVideo!;
            emit(GetProductVideoDoneState());
          }
        } else {
          emit(GetProductVideo404State());
        }
      }
    }).catchError((err) {
      print(err.toString());
      emit(GetProductVideoErrorState());
    });
  }
}
