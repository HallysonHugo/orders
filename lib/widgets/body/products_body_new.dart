import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sport_bar/services/response.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomBody extends StatelessWidget {
  final Widget body;
  final CustomResponse customResponse;
  final bool isGridView;
  const CustomBody({super.key, required this.body, required this.customResponse, required this.isGridView});


  @override
  Widget build(BuildContext context) {
    switch(customResponse.status){
      case Status.loading:
        return isGridView ? _loadingGridBody() : _loadingListBody();
      case Status.completed:
      return body;
      case Status.error:
        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animations/error.json', height: DeviceSize.getDeviceHeight(context) * 0.4,
                 width: DeviceSize.getDeviceWidth(context)* 0.3),
                CustomText(text: customResponse.error?.message ?? "Erro ao buscar os dados", color: Colors.black87,)
              ],
            )
        );
      default:
        return Container();
    }
  }
  
  Widget _loadingGridBody(){
    return  Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 5
          
        ),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ),);
  }

  Widget _loadingListBody(){
    return  Center(child: Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          color: Colors.red,
        ),
      ),));
  }

}