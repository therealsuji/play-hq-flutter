import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_hq/helpers/app_assets.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/helpers/app_constants.dart';
import 'package:play_hq/helpers/app_fonts.dart';
import 'package:play_hq/helpers/app_screen_utils.dart';
import 'package:play_hq/models/orders_model/orders.dart';
import 'package:play_hq/models/sales/sales_payload_model.dart';
import 'package:play_hq/view_models/orders/order_requests/order_request_view_model.dart';
import 'package:play_hq/widgets/custom_button_widget.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/game_picker_details_widget.dart';
import 'package:play_hq/widgets/gradient_text_widget.dart';
import 'package:provider/provider.dart';

class MySalesDetailsScreen extends StatefulWidget {
  final SalesPayload? salesPayload;

  MySalesDetailsScreen({this.salesPayload});

  @override
  _MySalesDetailsScreenState createState() => _MySalesDetailsScreenState();
}


class _MySalesDetailsScreenState extends State<MySalesDetailsScreen> {


  ScrollController? _controller;

  @override
  void initState() {
    Provider.of<OrderRequestViewModel>(context , listen: false).getOrderRequests(widget.salesPayload!.saleId ?? '');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(50)),
        child: Consumer<OrderRequestViewModel>(
          builder: (_ , val  , __)  {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Text(
                            'My Sales ID: ${widget.salesPayload?.price}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenUtils.getDesignHeight(137),
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30 , left: 24 , right: 24),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: ScreenUtils.getDesignWidth(100),
                          child: GamePickerGames(
                              gameName: widget.salesPayload?.gameList![index].game.title,
                              backgroundUrl:
                              widget.salesPayload?.gameList![index].game.boxCover,
                              releaseDate:
                              game_conditions.firstWhere((element) => element['API_Slug'] == widget.salesPayload!.gameList![0].status)['name']
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                      itemCount: widget.salesPayload?.gameList!.length ?? 0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30 , left: 24 , right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.salesPayload!.price} \LKR',
                          style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    height: 1.5,
                    decoration: BoxDecoration(
                        gradient: PRIMARY_GRADIENT,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  // Platform Details
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Platform',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${popularConsoles.firstWhere((element) => element['id'] == widget.salesPayload!.platform)['id']}",
                          style: TextStyle(
                            color: SUB_TEXT_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    height: 1.5,
                    decoration: BoxDecoration(
                        color: SUB_TEXT_COLOR,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  // Sale Creation Date
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sale Creation Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '12/12/2020',
                          // "${DateFormat('dd MMM yyyy').format(widget.salesPayload!.createdAt)}",
                          style: TextStyle(
                            color: SUB_TEXT_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    height: 1.5,
                    decoration: BoxDecoration(
                        color: SUB_TEXT_COLOR,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Negotiable?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: PRIMARY_COLOR,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            widget.salesPayload!.negotiable! ? TICK_MARK_ICON : CROSS_MARK_ICON,
                            color: Colors.white,
                            height: ScreenUtils.getDesignHeight(10.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    height: ScreenUtils.getDesignHeight(55),
                    color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          CustomTextWidget('Purchase Requests', isDynamic: false , style: Theme.of(context).primaryTextTheme.headline3,),
                          Spacer(),
                          CustomTextWidget('${val.orderRequests.length} Offers', isDynamic: true , maxWidth: 150 , minWidth: 30 , style: Theme.of(context).primaryTextTheme.headline4!.copyWith(color: PRIMARY_COLOR),)
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: ScreenUtils.getDesignHeight(250),
                        width: ScreenUtils.bodyWidth,
                        margin: EdgeInsets.only(top: 30, left: 24 , right: 24),
                        child: ListView.separated(
                            itemBuilder: (BuildContext context , int index){
                          return _purchaseRequestContainer(val.orderRequests[index]);
                        },
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (BuildContext context , int index){
                          return SizedBox(
                            width: ScreenUtils.getDesignWidth(15),
                          );
                        }, itemCount: val.orderRequests.length),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 24 , vertical: 30),
                      child: CustomButton(
                        buttonText: 'Delete sale' , width: double.infinity, height: 50, buttonColor: Colors.red,))
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  Widget _purchaseRequestContainer(Order orders){
    return Container(
      height: ScreenUtils.getDesignHeight(250),
      width: ScreenUtils.getDesignWidth(327),
      decoration: BoxDecoration(
        color: MAIN_CONTAINER_COLOR.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomTextWidget('Offered Price', isDynamic: false , style: Theme.of(context).primaryTextTheme.headline4,),
                Spacer(),
                GradientText('${orders.proposedPrice ?? 'Not mentioned'}', gradient: GREEN_GRADIENT , style: Theme.of(context).primaryTextTheme.headline4,)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  CustomTextWidget('Address', isDynamic: false , style: Theme.of(context).primaryTextTheme.headline4,),
                  Spacer(),
                  GradientText('${orders.seller!.address}', gradient: PRIMARY_GRADIENT , style: Theme.of(context).primaryTextTheme.headline4,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: PRIMARY_COLOR,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: ScreenUtils.getDesignHeight(50),
                    width: ScreenUtils.getDesignWidth(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(backgroundImage: NetworkImage((orders.seller!.avatar!.isNotEmpty ? orders.seller!.avatar : 'https://aeroclub-issoire.fr/wp-content/uploads/2020/05/image-not-found-300x225.jpg')!)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget('${orders.buyer!.displayName}', isDynamic: false , style: Theme.of(context).primaryTextTheme.headline4,),
                        Row(
                          children: [
                            CustomTextWidget('${orders.buyer!.rating ?? 'Not Rating Yet'}', isDynamic: false , style: Theme.of(context).primaryTextTheme.headline5!.copyWith(color: SUB_TEXT_COLOR),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomTextWidget('View Profile', isDynamic: false , style: Theme.of(context).primaryTextTheme.headline4!.copyWith(color: PRIMARY_COLOR),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: PRIMARY_COLOR,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Provider.of<OrderRequestViewModel>(context , listen: false).rejectPurchaseRequest(orders.id ?? ''),
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CustomTextWidget('Reject Offer', isDynamic: false , style: Theme.of(context).primaryTextTheme.headline4!.copyWith(color: Colors.red),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Provider.of<OrderRequestViewModel>(context , listen: false).acceptPurchaseRequest(orders.id ?? ''),
                    child: Container(
                      height: ScreenUtils.getDesignHeight(35),
                      width: ScreenUtils.getDesignWidth(95),
                      decoration: BoxDecoration(
                        gradient: PRIMARY_GRADIENT,
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Center(child: Text('Accept Offer' , style: TextStyle(fontFamily: CircularBook , fontSize: 12, fontWeight: FontWeight.bold , color: Colors.white),)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
