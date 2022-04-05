// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:http/http.dart' as http;
import './login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const route= '/home';
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}

class HomeScreenState extends State<StatefulWidget> {

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          Text('Hot news'),
          SizedBox(height: 10),
          Expanded(child: _content()),
          SizedBox(height: 10),
          Text('Bài viết mới cập nhật'),
          Container(
            width: width,
            height: heigth*0.72,
            child: _contentArti(),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.logout),
      //   onPressed: () {
      //     Navigator.of(context).pushReplacementNamed(LoginScreen.route);
      //   },
      // ),
    );
  }



  AppBar _appbar(){
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tin tức - ",
            style:
            TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
          Text(
            "News",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }


  Widget HomeBody(){
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ]
        ),
      ),
    );
  }



  Widget _card(){
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => CategoryNews(
      //         newsCategory: Text('Tin hot'),
      //       )
      //   ));
      // },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80',
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(
                'Tin tức mới',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardArti(){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacementNamed('/details');
        //   Navigator.push(context, MaterialPageRoute(
        //       builder: (context) => ArticleView(
        //         postUrl: posturl,
        //       )
        //   ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80',
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    'Bài viết',
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Viết chương trình gồm ít nhất một luồng các màn hình để trình bày layout các loại màn hình khác nhau của một ứng dụng. Ví dụ làm theo các layout trong tài liệu sau:',
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _content(){  //listview của card phân loại nhỏ trên cùng
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 21,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (context, index) {
            return _card();
          }),
    );
  }

  Widget _contentArti(){
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return _cardArti();
          }),
    );
  }


// List<CategorieModel> getCategories(){
//
//   List<CategorieModel> myCategories = List<CategorieModel>();
//   CategorieModel categorieModel;
//
//   //1
//   categorieModel = new CategorieModel();
//   categorieModel.categorieName = "Business";
//   categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
//   myCategories.add(categorieModel);
//
//   //2
//   categorieModel = new CategorieModel();
//   categorieModel.categorieName = "Entertainment";
//   categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
//   myCategories.add(categorieModel);
//
//   //3
//   categorieModel = new CategorieModel();
//   categorieModel.categorieName = "General";
//   categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
//   myCategories.add(categorieModel);
//
//   //4
//   categorieModel = new CategorieModel();
//   categorieModel.categorieName = "Health";
//   categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
//   myCategories.add(categorieModel);
//
//   //5
//   categorieModel = new CategorieModel();
//   categorieModel.categorieName = "Science";
//   categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
//   myCategories.add(categorieModel);
//
//   //5
//   categorieModel = new CategorieModel();
//   categorieModel.categorieName = "Sports";
//   categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
//   myCategories.add(categorieModel);
//
//   //5
//   categorieModel = new CategorieModel();
//   categorieModel.categorieName = "Technology";
//   categorieModel.imageAssetUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
//   myCategories.add(categorieModel);
//
//   return myCategories;
// }



}


