<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
   pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="
      <c:url value="/resources/css/bootstrap.min.css" />
      ">
      <link rel="stylesheet" href="
      <c:url value="/resources/css/app.css" />
      ">
   </head>
   <body>
      <c:url var="userUrl" value="/user"/>
      <!--  <jsp:include page="./templates/header.jsp"></jsp:include>  -->
      <div ng-controller="headerController" class="galaxy-header ng-scope">
         <div class="container">
            <div class="row">
               <div class="header-nav-wrapper">
                  <div class="col-md-4 col-sm-4 col-xs-4">
                     <div class="logo">
                        <a href="/">
                           <img src="resources/images/galaxy-logo.png" alt="Galaxy Cinema" class="hidden-xs hidden-sm">
                           <!-- <img src="resources/images/galaxy-logo-mobile.png" alt="Galaxy Cinema" class="hidden-lg hidden-md"> -->
                        </a>
                     </div>
                  </div>
                  <div class="col-md-8 col-sm-8 col-xs-8">
                     <div class="primary-nav-wrapper hidden-xs hidden-sm">
                        <div class="search">
                           <galaxy-search-bar class="ng-isolate-scope">
                              <form id="search-form" ng-submit="submit()" class="ng-pristine ng-valid">
                                 <div class="input-append">
                                    <input id="btn-search-header" placeholder="Tìm tên phim, diễn viên..." class="search-box ng-pristine ng-untouched ng-valid ng-empty" type="text" autocomplete="off" ng-model="searchKey" ng-model-options="{ updateOn: &quot;default blur&quot;, debounce: { default: 500, blur: 0 } }" ,="" ng-change="search(searchKey)">
                                    <button type="submit" class="search-btn"><i class="icon-search"></i>
                                    </button>
                                    <!-- ngIf: dataSearch && dataSearch.items && dataSearch.items.length>0 -->
                                 </div>
                              </form>
                           </galaxy-search-bar>
                        </div>
                        <div class="secondary-nav-wrapper">
                           <ul class="secondary-nav">
                              <li>
                                 <a id="loginLink" href="#" ng-show="!userInfo.memberId" ng-click="openLogin()"><i class="icon-user"></i>Đăng nhập</a><!-- ngIf: userInfo.memberId -->
                              </li>
                              <!--li--><!--  a#locationLink(href='#')--><!--    i.icon-place--><!--    | Chọn vị trí-->
                              <li class="language hidden-xs">
                                 <a href="/" class="active">VN</a><span>|</span><a href="/en/">EN</a>
                              </li>
                           </ul>
                        </div>
                        <!--.search-wrapper--><!--  ul.search--><!--    li--><!--      input#search-input(type='text', placeholder='Start typing then hit enter to search')--><!--    li--><!--      a.hide-search(href='#')--><!--        i.fa.fa-close-->
                     </div>
                     <div class="primary-nav-wrapper hidden-lg hidden-md">
                        <div class="secondary-nav-wrapper">
                           <ul class="secondary-nav">
                              <!--li--><!--  a(href)--><!--    i.icon-search--><!--li--><!--  a#locationLinkMobile(href='#')--><!--    i.icon-place--><!--    | #{i18n('Chọn vị trí')}-->
                              <li>
                                 <a id="loginLinkMobile" href="#" ng-show="!userInfo.memberId" ng-click="openLogin()"><i class="icon-user"></i>Đăng nhập</a><!-- ngIf: userInfo.memberId -->
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div ng-controller="navbarController" class="galaxy-nav ng-scope">
         <div class="container">
            <div class="search hidden-lg hidden-md">
               <galaxy-search-bar class="ng-isolate-scope">
                  <form id="search-form" ng-submit="submit()" class="ng-pristine ng-valid">
                     <div class="input-append">
                        <input id="btn-search-header" placeholder="Tìm tên phim, diễn viên..." class="search-box ng-pristine ng-untouched ng-valid ng-empty" type="text" autocomplete="off" ng-model="searchKey" ng-model-options="{ updateOn: &quot;default blur&quot;, debounce: { default: 500, blur: 0 } }" ,="" ng-change="search(searchKey)">
                        <button type="submit" class="search-btn"><i class="icon-search"></i></button>
                        <!-- ngIf: dataSearch && dataSearch.items && dataSearch.items.length>0 -->
                     </div>
                  </form>
               </galaxy-search-bar>
            </div>
            <nav>
               <ul class="primary-nav">
                  <li>
                     <!-- ngIf: isMobile == false -->
                     <a href="lich-chieu" ng-if="isMobile == false" class="ng-scope">Mua vé</a><!-- end ngIf: isMobile == false --><!-- ngIf: isMobile == true -->
                  </li>
                  <li class="sub-nav">
                     <!-- ngIf: isMobile == false -->
                     <a href="javascript:;" ng-if="isMobile == false" class="ng-scope">Phim</a>
                     <!-- end ngIf: isMobile == false --><!-- ngIf: isMobile == true -->
                     <div id="sub-menu">
                        <ul class="undefined">
                           <li>
                              <a href="phim-dang-chieu">Phim đang chiếu</a>
                           </li>
                           <li>
                              <a href="phim-sap-chieu">Phim sắp chiếu</a>
                           </li>
                        </ul>
                     </div>
                     <div id="sub-menu-movie" class="hidden-sm hidden-xs">
                        <div class="visible-lg-block">
                           <div class="row submenu-title">
                              <div class="col-sm-12">
                                 <h3><a href="phim-dang-chieu">Phim đang chiếu</a></h3>
                              </div>
                           </div>
                           <div class="row movies-group-header">
                              <!-- ngRepeat: movie in item.movieShowing | limitTo:4 -->
                              <div ng-repeat="movie in item.movieShowing | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2018/1/23/ho-nhat-duy-2_1516676326357.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/798muoi" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">798MƯỜI</h4>
                                    <h4 class="vn ng-binding"></h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieShowing | limitTo:4 -->
                              <div ng-repeat="movie in item.movieShowing | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2018/1/17/250x175_1516162983452.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/peter-rabbit" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">PETER RABBIT</h4>
                                    <h4 class="vn ng-binding">THỎ PETER</h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieShowing | limitTo:4 -->
                              <div ng-repeat="movie in item.movieShowing | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2018/1/2/sd_1514877019847.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/muse" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">MUSE</h4>
                                    <h4 class="vn ng-binding">NÀNG THƠ CỦA QUỶ</h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieShowing | limitTo:4 -->
                              <div ng-repeat="movie in item.movieShowing | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2017/12/22/thang5rucro_1513914094543.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/thang-nam-ruc-ro" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">THÁNG NĂM RỰC RỠ</h4>
                                    <h4 class="vn ng-binding"></h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieShowing | limitTo:4 -->
                           </div>
                           <div class="row submenu-title">
                              <div class="col-sm-12">
                                 <h3><a href="phim-sap-chieu">Phim sắp chiếu</a></h3>
                              </div>
                           </div>
                           <div class="row movies-group-header">
                              <!-- ngRepeat: movie in item.movieCommingSoon | limitTo:4 -->
                              <div ng-repeat="movie in item.movieCommingSoon | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2018/2/5/450_1517804806339.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/three-billboards-outside-ebbing-missouri" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">THREE BILLBOARDS OUTSIDE EBBING, MISSOURI</h4>
                                    <h4 class="vn ng-binding">THREE BILLBOARDS - TRUY TÌM CÔNG LÝ</h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieCommingSoon | limitTo:4 -->
                              <div ng-repeat="movie in item.movieCommingSoon | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2018/3/2/detective-k34_1519975450042.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/detective-k-secret-of-the-living-dead" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">DETECTIVE K: SECRET OF THE LIVING DEAD</h4>
                                    <h4 class="vn ng-binding">THÁM TỬ K: MA CÀ RỒNG BÁO THÙ</h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieCommingSoon | limitTo:4 -->
                              <div ng-repeat="movie in item.movieCommingSoon | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2018/1/16/awt-_1516092287588.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/nep-gap-thoi-gian" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">A WRINKLE IN TIME</h4>
                                    <h4 class="vn ng-binding">NẾP GẤP THỜI GIAN</h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieCommingSoon | limitTo:4 -->
                              <div ng-repeat="movie in item.movieCommingSoon | limitTo:4" class="col-sm-3 ng-scope">
                                 <article style="background-image: url(resources/media/2018/3/2/redsea2_1519976970593.jpg)" class="article-movie-header">
                                    <a href="/dat-ve/operation-red-sea" style="width:100%;">
                                       <figure>
                                          <figcaption class="overlay">
                                             <div class="movies-content-header">
                                                <galaxy-icon-movie ng-age="movie.age" class="ng-isolate-scope"></galaxy-icon-movie>
                                                <div class="group">
                                                   <div class="btn secondary-white btn-header">Mua vé</div>
                                                </div>
                                             </div>
                                          </figcaption>
                                       </figure>
                                    </a>
                                 </article>
                                 <div class="title-movie-header">
                                    <h4 class="ng-binding">OPERATION RED SEA</h4>
                                    <h4 class="vn ng-binding">ĐIỆP VỤ BIỂN ĐỎ</h4>
                                 </div>
                              </div>
                              <!-- end ngRepeat: movie in item.movieCommingSoon | limitTo:4 -->
                           </div>
                        </div>
                     </div>
                  </li>
                  <li class="sub-nav">
                     <!-- ngIf: isMobile == false --><a href="javascript:;" ng-if="isMobile == false" class="ng-scope">Góc điện ảnh</a><!-- end ngIf: isMobile == false --><!-- ngIf: isMobile == true -->
                     <div id="sub-menu">
                        <ul class="undefined">
                           <li><a href="dien-anh">Thể loại phim</a></li>
                           <li><a href="dien-vien">Diễn viên</a></li>
                           <li><a href="dao-dien">Đạo diễn</a></li>
                           <li><a href="binh-luan-phim">Bình luận phim</a></li>
                           <li><a href="movie-blog">Blog điện ảnh</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="sub-nav">
                     <!-- ngIf: isMobile == false --><a href="javascript:;" ng-if="isMobile == false" class="ng-scope">Sự kiện</a><!-- end ngIf: isMobile == false --><!-- ngIf: isMobile == true -->
                     <div id="sub-menu">
                        <ul class="undefined">
                           <li><a href="khuyen-mai">Ưu đãi</a></li>
                           <li><a href="phim-hay">Phim hay tháng</a></li>
                        </ul>
                     </div>
                  </li>
                  <li>
                     <!-- ngIf: isMobile == false --><a href="rap-gia-ve" ng-if="isMobile == false" class="ng-scope">Rạp/Giá Vé</a><!-- end ngIf: isMobile == false --><!-- ngIf: isMobile == true -->
                  </li>
                  <li>
                     <!-- ngIf: isMobile == false --><a href="gop-y" ng-if="isMobile == false" class="ng-scope">Hỗ trợ</a><!-- end ngIf: isMobile == false --><!-- ngIf: isMobile == true -->
                  </li>
                  <li>
                     <!-- ngIf: isMobile == false --><a href="chinh-sach" ng-if="isMobile == false" class="ng-scope">Thành viên</a><!-- end ngIf: isMobile == false --><!-- ngIf: isMobile == true -->
                  </li>
               </ul>
            </nav>
         </div>
      </div>
      <!-- kjdffhfkd -->
      <div id="main-carousel" data-ride="carousel" class="carousel slide">
         <ol class="carousel-indicators hidden-sm hidden-xs">
            <li data-target="#main-carousel" data-slide-to="0" class=""></li>
            <li data-target="#main-carousel" data-slide-to="1" class=""></li>
            <li data-target="#main-carousel" data-slide-to="2" class=""></li>
            <li data-target="#main-carousel" data-slide-to="3" class="active"></li>
            <li data-target="#main-carousel" data-slide-to="4" class=""></li>
            <li data-target="#main-carousel" data-slide-to="5" class=""></li>
         </ol>
         <div role="listbox" class="carousel-inner">
            <div href="/dat-ve/thang-nam-ruc-ro" link="/dat-ve/thang-nam-ruc-ro" class="item item-slide">
               <img src="resources/media/2018/2/23/banner-13_1519380079341.jpg"><!--img.img-responsive(src='https://www.galaxycine.vn/media/2018/2/2/banner-13_1517536370458.jpg')-->
               <div class="container content-wrap">
                  <div class="play-bt trailer-bt-banner">
                     <galaxy-watch-trailer ng-trailer="&quot;https://www.youtube.com/watch?v=RyQeBPpZqdY&quot;" data-title="&quot;THÁNG NĂM RỰC RỠ&quot;" class="ng-isolate-scope">
                        <a class="btn primary animated fadeInUp" ng-click="submit()"> trailer</a>
                     </galaxy-watch-trailer>
                  </div>
               </div>
            </div>
            <div href="/dat-ve/black-panther" link="/dat-ve/black-panther" class="item item-slide">
               <img src="resources/media/2018/2/23/banner-13_1519353857247.jpg"><!--img.img-responsive(src='https://www.galaxycine.vn/media/2018/2/2/banner-13_1517536370458.jpg')-->
               <div class="container content-wrap">
                  <div class="play-bt trailer-bt-banner">
                     <galaxy-watch-trailer ng-trailer="&quot;https://www.youtube.com/watch?v=W1WAZbbYuos&quot;" data-title="&quot;Black Panther&quot;" class="ng-isolate-scope">
                        <a class="btn primary animated fadeInUp" ng-click="submit()"> trailer</a>
                     </galaxy-watch-trailer>
                  </div>
               </div>
            </div>
            <div href="/phim-hay/phim-hay-thang-032018-su-len-ngoi-cua-nhung-nang-tho" link="/phim-hay/phim-hay-thang-032018-su-len-ngoi-cua-nhung-nang-tho" class="item item-slide active left">
               <img src="resources/media/2018/3/2/banner-t03_1519973570766.jpg"><!--img.img-responsive(src='https://www.galaxycine.vn/media/2018/2/2/banner-webmoi_1517559980812.jpg')-->
            </div>
            <div href="/dat-ve/798muoi" link="/dat-ve/798muoi" class="item item-slide next left">
               <img src="resources/media/2018/2/23/78910-bannerwebmoi_1519374452854.jpg"><!--img.img-responsive(src='https://www.galaxycine.vn/media/2018/2/2/banner-13_1517536370458.jpg')-->
               <div class="container content-wrap">
                  <div class="play-bt trailer-bt-banner">
                     <galaxy-watch-trailer ng-trailer="&quot;https://www.youtube.com/watch?v=gqoDAJk10pk&quot;" data-title="&quot;798Mười&quot;" class="ng-isolate-scope">
                        <a class="btn primary animated fadeInUp" ng-click="submit()"> trailer</a>
                     </galaxy-watch-trailer>
                  </div>
               </div>
            </div>
            <div href="khuyen-mai/dong-gia-45000dve-2d" link="khuyen-mai/dong-gia-45000dve-2d" class="item item-slide">
               <img src="resources/media/2018/1/29/45k-banner_1517195646155.jpg"><!--img.img-responsive(src='https://www.galaxycine.vn/media/2018/2/2/banner-webmoi_1517559980812.jpg')-->
            </div>
            <div href="khuyen-mai/tang-ngay-100k-mua-ve-phim-tet-tai-galaxy-cinema" link="khuyen-mai/tang-ngay-100k-mua-ve-phim-tet-tai-galaxy-cinema" class="item item-slide">
               <img src="resources/media/2018/2/13/chewy-banner_1518507336522.jpg"><!--img.img-responsive(src='https://www.galaxycine.vn/media/2018/2/2/banner-webmoi_1517559980812.jpg')-->
            </div>
         </div>
      </div>
      <!-- phim dang chieu  -->
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="tab-movies">
                  <div class="tab-movies-line">
                     <div class="hot-news pull-right"><i class="icon-hotnews"></i><a href="https://www.galaxycine.vn/dat-ve/thang-nam-ruc-ro">Tháng Năm Rực Rỡ - Phim Remake Xuất Sắc Nhất Từ Trước Đến Nay</a></div>
                     <ul class="nav nav-tabs movie-home">
                        <li class="active"><a href="#tab_default_1" data-toggle="tab">Phim đang chiếu</a></li>
                        <li><a href="#tab_default_2" data-toggle="tab">Phim sắp chiếu</a></li>
                     </ul>
                     <div class="tab-content">
                        <div id="tab_default_1" class="tab-pane active">
                           <div class="row movies-group animated fadeInUp">
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/1/23/ho-nhat-duy-2_1516676326357.jpg">
                                    <a href="/dat-ve/798muoi">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i class="icon-c16"></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <!--article.article-movie(style='background-image: url(#{item.imageLandscape})')--><!--  figure--><!--    figcaption.overlay--><!--      .movies-content--><!--        i(class='#{getIcon(item.age)}')--><!--        .group--><!--          a.btn.secondary-white(href='#{getUrlMovieDetail(item.slug)}') #{i18n('mua vé')}-->
                                 <div class="title-movie">
                                    <h4>798MƯỜI</h4>
                                    <h4 class="vn"></h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/1/17/250x175_1516162983452.jpg">
                                    <a href="/dat-ve/peter-rabbit">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <!--article.article-movie(style='background-image: url(#{item.imageLandscape})')--><!--  figure--><!--    figcaption.overlay--><!--      .movies-content--><!--        i(class='#{getIcon(item.age)}')--><!--        .group--><!--          a.btn.secondary-white(href='#{getUrlMovieDetail(item.slug)}') #{i18n('mua vé')}-->
                                 <div class="title-movie">
                                    <h4>PETER RABBIT</h4>
                                    <h4 class="vn">THỎ PETER</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/1/2/sd_1514877019847.jpg">
                                    <a href="/dat-ve/muse">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i class="icon-c18"></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <!--article.article-movie(style='background-image: url(#{item.imageLandscape})')--><!--  figure--><!--    figcaption.overlay--><!--      .movies-content--><!--        i(class='#{getIcon(item.age)}')--><!--        .group--><!--          a.btn.secondary-white(href='#{getUrlMovieDetail(item.slug)}') #{i18n('mua vé')}-->
                                 <div class="title-movie">
                                    <h4>MUSE</h4>
                                    <h4 class="vn">NÀNG THƠ CỦA QUỶ</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2017/12/22/thang5rucro_1513914094543.jpg">
                                    <a href="/dat-ve/thang-nam-ruc-ro">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i class="icon-c16"></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <!--article.article-movie(style='background-image: url(#{item.imageLandscape})')--><!--  figure--><!--    figcaption.overlay--><!--      .movies-content--><!--        i(class='#{getIcon(item.age)}')--><!--        .group--><!--          a.btn.secondary-white(href='#{getUrlMovieDetail(item.slug)}') #{i18n('mua vé')}-->
                                 <div class="title-movie">
                                    <h4>THÁNG NĂM RỰC RỠ</h4>
                                    <h4 class="vn"></h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/2/21/lg450_1519194058449.jpg">
                                    <a href="/dat-ve/looking-glass">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i class="icon-c18"></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <!--article.article-movie(style='background-image: url(#{item.imageLandscape})')--><!--  figure--><!--    figcaption.overlay--><!--      .movies-content--><!--        i(class='#{getIcon(item.age)}')--><!--        .group--><!--          a.btn.secondary-white(href='#{getUrlMovieDetail(item.slug)}') #{i18n('mua vé')}-->
                                 <div class="title-movie">
                                    <h4>LOOKING GLASS</h4>
                                    <h4 class="vn">BÍ ẨN SAU TẤM GƯƠNG</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/2/21/game-night-450_1519180629790.jpg">
                                    <a href="/dat-ve/game-night">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i class="icon-c18"></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <!--article.article-movie(style='background-image: url(#{item.imageLandscape})')--><!--  figure--><!--    figcaption.overlay--><!--      .movies-content--><!--        i(class='#{getIcon(item.age)}')--><!--        .group--><!--          a.btn.secondary-white(href='#{getUrlMovieDetail(item.slug)}') #{i18n('mua vé')}-->
                                 <div class="title-movie">
                                    <h4>GAME NIGHT</h4>
                                    <h4 class="vn">ĐÊM CHƠI NHỚ ĐỜI</h4>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12 col-sm-12 col-xs-12 pull-right"><a href="/phim-dang-chieu" class="btn secondary fl-right">Xem thêm</a></div>
                           </div>
                        </div>
                        <div id="tab_default_2" class="tab-pane">
                           <div class="row movies-group animated fadeInUp">
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/2/5/450_1517804806339.jpg">
                                    <a href="/dat-ve/three-billboards-outside-ebbing-missouri">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <div class="title-movie">
                                    <h4>THREE BILLBOARDS OUTSIDE EBBING, MISSOURI</h4>
                                    <h4 class="vn">THREE BILLBOARDS - TRUY TÌM CÔNG LÝ</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/3/2/detective-k34_1519975450042.jpg">
                                    <a href="/dat-ve/detective-k-secret-of-the-living-dead">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <div class="title-movie">
                                    <h4>DETECTIVE K: SECRET OF THE LIVING DEAD</h4>
                                    <h4 class="vn">THÁM TỬ K: MA CÀ RỒNG BÁO THÙ</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/1/16/awt-_1516092287588.jpg">
                                    <a href="/dat-ve/nep-gap-thoi-gian">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <div class="title-movie">
                                    <h4>A WRINKLE IN TIME</h4>
                                    <h4 class="vn">NẾP GẤP THỜI GIAN</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/3/2/redsea2_1519976970593.jpg">
                                    <a href="/dat-ve/operation-red-sea">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <div class="title-movie">
                                    <h4>OPERATION RED SEA</h4>
                                    <h4 class="vn">ĐIỆP VỤ BIỂN ĐỎ</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/2/21/tomb-r2_1519191376263.jpg">
                                    <a href="/dat-ve/tomb-raider">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <div class="title-movie">
                                    <h4>TOMB RAIDER</h4>
                                    <h4 class="vn">TOMB RAIDER: HUYỀN THOẠI BẮT ĐẦU</h4>
                                 </div>
                              </div>
                              <div class="col-md-4 col-sm-4 col-xs-6 movie-item">
                                 <div class="article-movie-home">
                                    <img src="resources/media/2018/2/5/450_1517808107383.jpg">
                                    <a href="/dat-ve/goodbye-christopher-robin">
                                       <div class="decription-hover overlay">
                                          <div class="movies-content">
                                             <i></i>
                                             <div class="group">
                                                <div class="btn secondary-white">mua vé</div>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                                 <div class="title-movie">
                                    <h4>GOODBYE CHRISTOPHER ROBIN</h4>
                                    <h4 class="vn">TẠM BIỆT CHRISTOPHER ROBIN</h4>
                                 </div>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12 col-sm-12 col-xs-12 pull-right"><a href="/phim-sap-chieu" class="btn secondary fl-right">Xem thêm</a></div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Galaxy phim -->
      <div class="row">
         <div class="col-md-12 col-xs-12">
            <section id="content-seo">
               <h3>Galaxy Cinema</h3>
               <div class="row content-seo">
                  <div class="col-md-12">
                     <div class="content-text">
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Galaxy Cinema</span></span></b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">&nbsp;là một trong những công ty tư nhân đầu tiên về điện ảnh được thành lập từ năm 2003, đã khẳng định thương hiệu là 1 trong 10 địa điểm vui chơi giải trí được yêu thích nhất. Ngoài hệ thống rạp chiếu phim hiện đại, thu hút hàng triệu lượt người đến xem, <b>Galaxy Cinema</b> còn hấp dẫn khán giả bởi không khí thân thiện cũng như chất lượng dịch vụ hàng đầu.</span></span></span></span></p>
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Đến website <a href="https://www.galaxycine.vn/"><i>galaxycine.vn</i></a>, quý khách sẽ được cập nhật nhanh chóng các <a href="https://www.galaxycine.vn/phim-dang-chieu"><i>phim hay nhất</i></a> <i>phim mới nhất</i> đang chiếu hoặc sắp chiếu. <a href="https://www.galaxycine.vn/lich-chieu"><i>Lịch chiếu</i></a> tại mọi hệ thống <a href="https://www.galaxycine.vn/"><i>rạp chiếu phim</i> </a>của <b>Galaxy Cinema</b> cũng được cập nhật đầy đủ hàng ngày hàng giờ trên<i> trang chủ</i>. </span></span></span></span></p>
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Đặt vé tại <b>Galaxy Cinema </b>dễ dàng chỉ sau vài thao tác vô cùng đơn giản. Để mua vé, hãy vào tab Mua vé. Quý khách có thể chọn Mua vé theo phim, theo rạp, theo ngày tùy cách nào tiện lợi nhất cho bản thân.Sau đó, tiến hành mua vé theo các bước hướng dẫn. Chỉ trong vài phút, quý khách sẽ nhận được tin nhắn và email phản hồi <i>Đặt vé thành công</i> của <a href="https://www.galaxycine.vn/"><b>Galaxy Cinema</b></a>. Quý khách có thể dùng tin nhắn lấy vé tại quầy vé của <b>Galaxy Cinema</b> hoặc quét mã QR để một bước vào rạp mà không cần tốn thêm bất kỳ công đoạn nào nữa.</span></span></span></span></p>
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nếu bạn đã chọn được <a href="https://www.galaxycine.vn/phim-dang-chieu"><i>phim hay</i></a> để xem, hãy đặt vé cực nhanh bằng box <i>Mua Vé Nhanh</i> ngay từ <a href="https://www.galaxycine.vn/"><i>Trang Chủ</i></a>. Chỉ cần một phút, tin nhắn và email phản hồi của <b>Galaxy Cinema </b>sẽ gửi ngay vào điện thoại và hộp mail của bạn. </span></span></span></span></p>
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nếu chưa quyết định sẽ xem <i>phim mới</i> nào, hãy tham khảo các bộ <i>phim hay</i> trong mục<a href="https://www.galaxycine.vn/phim-dang-chieu"> <i>Phim Đang Chiếu</i></a> cũng như <a href="https://www.galaxycine.vn/phim-sap-chieu"><i>Phim Sắp Chiếu</i> </a>tại <a href="https://www.galaxycine.vn/"><i>rạp chiếu phim</i></a> bằng cách vào mục <a href="https://www.galaxycine.vn/binh-luan-phim"><i>Bình Luận Phim</i></a> ở <i><a href="http://beta.galaxycine.vn/dien-anh">Góc Điện Ảnh</a> </i>để đọc những bài bình luận chân thật nhất, tham khảo và cân nhắc. Sau đó, quý khách hãy đặt vé bằng box <i>Mua Vé Nhanh</i> ngay ở đầu trang để chọn được suất chiếu và chỗ ngồi vừa ý nhất. &nbsp;</span></span></span></span></p>
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Galaxy Cinema</span></span></b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"> luôn có những chương trình<a href="https://www.galaxycine.vn/khuyen-mai"> <i>khuyến mãi</i>, <i>ưu đãi</i></a>, quà tặng vô cùng hấp dẫn như <i>giảm giá</i> vé, tặng vé xem phim miễn phí, tặng Combo, tặng quà phim… &nbsp;dành cho quý khách. </span></span></span></span></p>
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Trang web <i>galaxycine.vn</i> còn có mục <i>Góc Điện Ảnh</i> - sở hữu lượng dữ liệu về phim, diễn viên và đạo diễn, giúp quý khách dễ dàng chọn được phim mình yêu thích và nâng cao kiến thức về điện ảnh của bản thân. Ngoài ra, vào mỗi tháng, <strong>Galaxy Cinema</strong> cũng giới thiệu các <a href="https://www.galaxycine.vn/phim-sap-chieu"><i>phim sắp chiếu</i></a> hot nhất trong mục <a href="https://www.galaxycine.vn/phim-hay"><i>Phim Hay Tháng</i> </a>để quý khách sớm có sự tính toán.</span></span></span></span></p>
                        <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Hiện nay, <strong><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Galaxy Cinema</span></strong> đang ngày càng phát triển hơn nữa với các chương trình đặc sắc, các khuyến mãi hấp dẫn, đem đến cho khán giả những bộ phim bom tấn của thế giới và Việt Nam nhanh chóng và sớm nhất.</span></span></span></span></p>
                     </div>
                  </div>
               </div>
            </section>
         </div>
      </div>
      <h1>Home page</h1>
      <a href="${userUrl}">Show User list</a>
      <br>
      <br>
  
  <!-- ADS -->
<div class="row">
   <div class="col-md-12 col-xs-12">
      <section id="promotion">
         <a href="/khuyen-mai" class="title-block">
            <h3>Tin khuyến mãi</h3>
         </a>
         <div class="row promotion">
            <div class="col-md-3 col-sm-4 col-xs-6">
               <div class="promotion-item-home">
                  <a href="/khuyen-mai/thong-bao-ve-cac-chuong-trinh-giam-gia-combo"><img src="resources/media/2018/3/1/300x450_1519897954127.jpg"></a>
                  <div class="decription-hover overlay hidden-xs">
                     <a href="/khuyen-mai/thong-bao-ve-cac-chuong-trinh-giam-gia-combo">
                        <div class="info">
                           <h2>Thông Báo Về Các Chương Trình Giảm Giá Combo</h2>
                           <p></p>
                           <p>
                              <span style="font-size:14px;">
                                 <!--| --><span style="font-family:Arial,Helvetica,sans-serif;">Thông báo mới về chương trình giảm giá Combo tại Galaxy Cinema</span>
                              </span>
                           </p>
                           <p></p>
                        </div>
                     </a>
                     <div class="group"><a href="/khuyen-mai/thong-bao-ve-cac-chuong-trinh-giam-gia-combo"></a><a href="/khuyen-mai/thong-bao-ve-cac-chuong-trinh-giam-gia-combo" class="btn secondary-white">chi tiết</a></div>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
               <div class="promotion-item-home">
                  <a href="/khuyen-mai/htp--cm-mua-02-tang-02"><img src="resources/media/2018/2/13/300_1518507293774.jpg"></a>
                  <div class="decription-hover overlay hidden-xs">
                     <a href="/khuyen-mai/htp--cm-mua-02-tang-02">
                        <div class="info">
                           <h2>[HTP &amp; CM] Mua 02 Tặng 02</h2>
                           <p></p>
                           <p>
                              <span style="font-family:Arial,Helvetica,sans-serif;">
                                 <span style="font-size: 14px;">
                                    <!--| --><span style="line-height: 150%;">Mua 02 vé phim tại <b>Galaxy Huỳnh Tấn Phát </b>và <b>Galaxy Cà Mau</b>, nhận ngay 02 món quà vô cùng hấp dẫn!</span>
                                 </span>
                              </span>
                           </p>
                           <p></p>
                        </div>
                     </a>
                     <div class="group"><a href="/khuyen-mai/htp--cm-mua-02-tang-02"></a><a href="/khuyen-mai/htp--cm-mua-02-tang-02" class="btn secondary-white">chi tiết</a></div>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
               <div class="promotion-item-home">
                  <a href="/khuyen-mai/tang-ngay-100k-mua-ve-phim-tet-tai-galaxy-cinema"><img src="resources/media/2018/2/13/feature-300x450_1518503821432.png"></a>
                  <div class="decription-hover overlay hidden-xs">
                     <a href="/khuyen-mai/tang-ngay-100k-mua-ve-phim-tet-tai-galaxy-cinema">
                        <div class="info">
                           <h2>Tặng Ngay 100k Mua Vé Phim Tết Tại Galaxy Cinema</h2>
                           <p></p>
                           <p>
                              <!--| --><span style="font-family:Arial,Helvetica,sans-serif;"><span style="font-size: 14px;"><span style="line-height: 115%;"><span style="line-height: 115%;">Nhập mã “galaxycine”, liên kết Ngân hàng và Nạp tiền vào Ví MoMo để nhận ngay 02 thẻ quà tặng trị giá đến 100k!</span></span></span></span>
                           </p>
                           <p></p>
                        </div>
                     </a>
                     <div class="group"><a href="/khuyen-mai/tang-ngay-100k-mua-ve-phim-tet-tai-galaxy-cinema"></a><a href="/khuyen-mai/tang-ngay-100k-mua-ve-phim-tet-tai-galaxy-cinema" class="btn secondary-white">chi tiết</a></div>
                  </div>
               </div>
            </div>
            <div class="col-md-3 col-sm-4 col-xs-6">
               <div class="promotion-item-home">
                  <a href="/khuyen-mai/don-tet-voi-combo-peter-rabbit-sieu-dang-yeu"><img src="resources/media/2018/2/5/300x450_1517816463919.jpg"></a>
                  <div class="decription-hover overlay hidden-xs">
                     <a href="/khuyen-mai/don-tet-voi-combo-peter-rabbit-sieu-dang-yeu">
                        <div class="info">
                           <h2>Đón Tết Với Combo Peter Rabbit Siêu Đáng Yêu</h2>
                           <p></p>
                           <p>
                              <span style="font-size:14px;"><span style="font-family: Arial,Helvetica,sans-serif;"><span style="line-height: 150%;"><span style="line-height: 150%;">Nhân dịp chú thỏ Peter đầy năng động và thông minh “du hí” đến Việt Nam, <b>Galaxy Cinema</b> dành tặng các Stars <b>Combo Peter Rabbit</b>.</span></span></span></span><!--| -->
                           </p>
                           <p></p>
                        </div>
                     </a>
                     <div class="group"><a href="/khuyen-mai/don-tet-voi-combo-peter-rabbit-sieu-dang-yeu"></a><a href="/khuyen-mai/don-tet-voi-combo-peter-rabbit-sieu-dang-yeu" class="btn secondary-white">chi tiết</a></div>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>
</div>
      <!-- footer -->
      <footer class="footer-bg">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                  <ul class="list-unstyled clear-margins">
                     <li class="widget-container widget_nav_menu">
                        <h1 class="title-widget">Giới thiệu</h1>
                        <ul>
                           <li><a href="/ve-chung-toi"><i class="fa fa-angle-double-right"></i> Về chúng tôi</a></li>
                           <li><a href="/thoa-thuan-su-dung"><i class="fa fa-angle-double-right"></i> Thoả thuận sử dụng</a></li>
                           <li><a href="/quy-che-hoat-dong"><i class="fa fa-angle-double-right"></i> Quy chế hoạt động</a></li>
                           <li><a href="/chinh-sach-bao-mat"><i class="fa fa-angle-double-right"></i> Chính sách bảo mật</a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
               <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                  <ul class="list-unstyled clear-margins">
                     <li class="widget-container widget_nav_menu">
                        <h1 class="title-widget">Góc điện ảnh</h1>
                        <ul>
                           <li><a href="/dien-anh"><i class="fa fa-angle-double-right"></i> Thể loại phim</a></li>
                           <li><a href="/binh-luan-phim"><i class="fa fa-angle-double-right"></i> Bình luận phim</a></li>
                           <li><a href="/movie-blog"><i class="fa fa-angle-double-right"></i> Blog điện ảnh</a></li>
                           <li><a href="/phim-hay"><i class="fa fa-angle-double-right"></i> Phim hay tháng</a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
               <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                  <ul class="list-unstyled clear-margins">
                     <li class="widget-container widget_nav_menu">
                        <h1 class="title-widget">Hỗ trợ</h1>
                        <ul>
                           <li><a href="/gop-y"><i class="fa fa-angle-double-right"></i> Góp ý</a></li>
                           <li><a href="/sale-and-service"><i class="fa fa-angle-double-right"></i> Sale &amp; Services</a></li>
                           <li><a href="/rap-gia-ve"><i class="fa fa-angle-double-right"></i> Rạp / giá vé</a></li>
                           <li><a href="/tuyen-dung"><i class="fa fa-angle-double-right"></i> Tuyển dụng</a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
               <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                  <ul class="list-unstyled clear-margins">
                     <li class="widget-container widget_recent_news">
                        <h1 class="title-widget">Kết nối Galaxy cinema</h1>
                        <div class="social-icons">
                           <ul class="nomargin">
                              <a href="https://facebook.com/galaxycine.vn" target="_blank"><i id="social" class="icon-facebook-app-logo social-fb"></i></a><a href="https://www.youtube.com/user/galaxymovies" target="_blank"><i id="social" class="icon-youtube-logo social-youtube"></i></a><!--a(href='#{config.instagramUrl}' target="_blank")--><!--  i#social.icon-instagram-logo.social-inst--><a href="https://www.instagram.com/galaxycinema/" target="_blank"><i id="social" class="icon-instagram-logo social-inst"></i></a>
                           </ul>
                        </div>
                     </li>
                  </ul>
                  <div class="store">
                     <ul class="list-unstyled clear-margins">
                        <li class="widget-container widget_recent_news">
                           <h1 class="title-widget">Download app</h1>
                           <div class="social-icons">
                              <ul class="nomargin">
                                 <!--a(href='#{config.iosAppUrl}' target="_blank")--><a href="https://itunes.apple.com/vn/app/galaxy-cinema/id593312549?l=vi&amp;mt=8" target="_blank"><i id="social" class="icon-apple-store social-store"></i></a><!--a(href='#{config.androidAppUrl}' target="_blank")--><a href="https://play.google.com/store/apps/details?id=com.galaxy.cinema&amp;hl=vi" target="_blank"><i id="social" class="icon-google-play social-store"></i></a>
                              </ul>
                           </div>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </footer>
   </body>
   <script type="text/javascript" src="
   <c:url value="/resources/js/bootstrap.min.js" />
   "></script>
   <script type="text/javascript" src="
   <c:url value="/resources/js/app.js" />
   "></script>
</html>