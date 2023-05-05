part of 'product_cubit.dart';

@immutable
abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

// Get Product Gallery States:

class GetProductGalleryLoadingState extends ProductStates {}

class GetProductGalleryDoneState extends ProductStates {}

class GetProductGalleryErrorState extends ProductStates {}

// Get Product Video States:

class GetProductVideoLoadingState extends ProductStates {}

class GetProductVideo404State extends ProductStates {}

class GetProductVideoDoneState extends ProductStates {}

class GetProductVideoErrorState extends ProductStates {}
