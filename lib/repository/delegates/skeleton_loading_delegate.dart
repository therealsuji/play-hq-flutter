

import 'package:play_hq/repository/clients/skeleton_loading_repository.dart';

class SkeletonLoadingDelegate extends SkeletonLoadingRepository {

  bool _loadingState = false;

  @override
  void hideSkeletonLoading() async{
    _loadingState = false;
  }

  @override
  void showSkeletonLoading() async{
    _loadingState = true;
  }

  @override
  bool get loadingState => _loadingState;

}