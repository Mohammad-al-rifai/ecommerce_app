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
}
