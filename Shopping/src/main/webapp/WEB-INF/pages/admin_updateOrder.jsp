<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <title>AbsoluteAdmin - A Responsive Boostrap 3 Admin Dashboard</title>
  <meta name="keywords" content="Bootstrap 3 Admin Dashboard Template Theme" />
  <meta name="description" content="AdminDesigns - Bootstrap 3 Admin Dashboard Theme">
  <meta name="author" content="AdminDesigns">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Google font -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

  <!-- Bootstrap -->
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>

  <!-- Slick -->
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>

  <!-- nouislider -->
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>

  <!-- Font Awesome Icon -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">

  <!-- Custom stlylesheet -->
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>


  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/plugins/datatables/media/css/dataTables.bootstrap.css">

  <!-- Datatables Editor Addon CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/plugins/datatables/extensions/Editor/css/dataTables.editor.css">

  <!-- Datatables ColReorder Addon CSS -->
  <link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/vendor/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css">

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/skin/default_skin/css/theme.css">
  <!-- <link rel="stylesheet" type="text/css" href="css/theme.css"> -->

  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">


  <!-- 1. 导入CSS的全局样式 -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
  <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
  <!-- 3. 导入bootstrap的js文件 -->
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
  <style type="text/css">
    td, th {
      text-align: center;
    }
    .cta {
      display: flex;
      padding: 11px 33px;
      text-decoration: none;
      font-family: 'Poppins', sans-serif;
      font-size: 25px;
      color: white;
      background: #6225E6;
      transition: 1s;
      box-shadow: 6px 6px 0 black;
      transform: skewX(-15deg);
      border: none;
    }

    .cta:focus {
      outline: none;
    }

    .cta:hover {
      transition: 0.5s;
      box-shadow: 10px 10px 0 #FBC638;
    }

    .cta .second {
      transition: 0.5s;
      margin-right: 0px;
    }

    .cta:hover  .second {
      transition: 0.5s;
      margin-right: 45px;
    }

    .span {
      transform: skewX(15deg)
    }

    .second {
      width: 20px;
      margin-left: 30px;
      position: relative;
      top: 12%;
    }

    .one {
      transition: 0.4s;
      transform: translateX(-60%);
    }

    .two {
      transition: 0.5s;
      transform: translateX(-30%);
    }

    .cta:hover .three {
      animation: color_anim 1s infinite 0.2s;
    }

    .cta:hover .one {
      transform: translateX(0%);
      animation: color_anim 1s infinite 0.6s;
    }

    .cta:hover .two {
      transform: translateX(0%);
      animation: color_anim 1s infinite 0.4s;
    }

    @keyframes color_anim {
      0% {
        fill: white;
      }

      50% {
        fill: #FBC638;
      }

      100% {
        fill: white;
      }
    }
  </style>
</head>

<body class="datatables-page" data-spy="scroll" data-target="#nav-spy" data-offset="300">

  <!-- Start: Main -->
  <div id="main">

    <!-- 顶上栏 -->
    <header class="navbar navbar-fixed-top navbar-shadow">
      <div class="navbar-branding">
        <a class="navbar-brand">
         <b>Electro.</b>电商城管理系统
        </a>
        <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
      </div>
    </header>
    <!-- 顶上栏end -->

    <!--侧边栏 -->
    <aside id="sidebar_left" class="nano nano-light affix">
      <div class="sidebar-left-content nano-content">

        <!-- 用户信息 -->
        <header class="sidebar-header">

          <!-- Sidebar Widget - Author -->
          <div class="sidebar-widget author-widget">
            <div class="media">
              <a class="media-left" href="#">
                <img src="../../assets/img/avatars/3.jpg" class="img-responsive">
              </a>
              <div class="media-body">
                <div class="media-links">
                  <a href="${pageContext.request.contextPath}/user/toPagesLogin">Logout</a>
                </div>
                <div class="media-author">Hello,${sessionScope.user.username}</div>
              </div>
            </div>
          </div>
        </header>
        <!-- 用户信息end -->

        <!-- 下面的菜单 -->
        <%--菜单--%>
        <ul class="nav sidebar-menu">
          <li class="sidebar-label pt20">Menu</li>
          <li class="active">
            <a href="${pageContext.request.contextPath}/initShopping">
              <span class="glyphicon glyphicon-home"></span>
              <span class="sidebar-title">商城官网</span>
            </a>
          </li>
          <%--专用工具--%>
          <li class="sidebar-label pt15">Exclusive Tools</li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/toAdminIndex">
              <span class="fa fa-envelope-o"></span>
              <span class="sidebar-title">商品管理(上架,下架,库存变更)</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/toAdminOrderList">
              <span class="fa fa-envelope-o"></span>
              <span class="sidebar-title">订单管理(发货,处理退货)</span>
            </a>
          </li>

          <li>
            <a href="${pageContext.request.contextPath}/admin/toManageUsers">
              <span class="fa fa-envelope-o"></span>
              <span class="sidebar-title">用户管理(封禁)</span>
            </a>
          </li>
        </ul>
        <!-- 下面的菜单end -->
      </div>
    </aside>
    <!--侧边栏end -->

    <!-- 主要内容 -->
    <section id="content_wrapper">
      <!-- 主体导航栏 -->
      <header id="topbar" class="alt">
        <div class="topbar-left">
          <ol class="breadcrumb">
            <li class="crumb-icon">
              <a href="${pageContext.request.contextPath}/admin/toAdminIndex">
                <span class="glyphicon glyphicon-home"></span>
              </a>
            </li>
            <li class="crumb-link">
              商城管理员
            </li>
          </ol>
        </div>
      </header>
      <!-- 主体导航栏end -->


      <!-- 表格 -->
      <section id="content" class="table-layout animated fadeIn">
        <div class="col-md-12">
          <div class="panel panel-visible" id="spy2">
            <div class="panel-heading">
              <div class="panel-title hidden-xs">
                <span class="glyphicon glyphicon-tasks"></span>订单信息
              </div>
              <div class="form-group">
                <label >订单编号: <span style="color: coral"> ${orderUUid} </span>创建时间: <span style="color: coral"> ${createTime}</span></label>
                <br>
                <label >收货人: <span style="color: coral">${dealingList.get(0).address.name}</span>
                  收货地址:<span style="color: coral"> ${dealingList.get(0).address.city} ${dealingList.get(0).address.detail}</span>   联系电话:<span style="color: coral"> ${dealingList.get(0).address.phone}</span></label>
                <br>
                <h3>订单详情</h3>
                <form method="get" action="${pageContext.request.contextPath}/admin/updateOrder">
                  <input type="hidden" name="oid" value="${dealingList.get(0).oid}">
                  <c:forEach items="${dealingList}" var="orderDealing" varStatus="x">
                      <div class="form-group">
                      </div>
                      <div class="form-group" style="border-bottom: 1px solid black;padding-bottom: 20px">
                        <span style="color: darkred">${orderDealing.count}</span> x <span style="color: darkred">${orderDealing.oldCname}</span>
                        <input name="cid" value="${orderDealing.cid}" type="hidden">
                        <c:if test="${orderDealing.status == 0 }">
                          <span style="color: red">(未发货)</span>
                        </c:if>
                        <c:if test="${orderDealing.status == 3 }">
                          <span style="color: red">(卖家申请退款)</span>
                          <a href="${pageContext.request.contextPath}/admin/ok?oid=${orderDealing.oid}&cid=${orderDealing.cid}&status=9">同意</a>
                          <a href="${pageContext.request.contextPath}/admin/no?oid=${orderDealing.oid}&cid=${orderDealing.cid}&status=6">拒绝</a>
                        </c:if>
                        <c:if test="${orderDealing.status == 5 }">
                          <span style="color: coral">(已发货)</span>
                        </c:if>
                        <c:if test="${orderDealing.status == 7 }">
                          <span style="color: red">(卖家已经签收 申请退货)</span>
                        </c:if>
                        <c:if test="${orderDealing.status == 9 }">
                          <span style="color: green">(已签收 订单已完成)</span>
                        </c:if>
                        <c:if test="${orderDealing.status == 10 }">
                          <span style="color: red">(退款成功 订单已完成)</span>
                        </c:if>
                        <c:if test="${orderDealing.status!=9&&orderDealing.status!=10}">
                          <input style="width: 30%" type="text" class="form-control" name="tracking" placeholder="填写快递单后视为发货,请仔细填写" value="${orderDealing.tracking}">
                        </c:if>
                        <c:if test="${orderDealing.status==9||orderDealing.status==10}">
                          <input style="width: 30%" type="text" class="form-control" disabled value="${orderDealing.tracking}">
                        </c:if>
                      </div>
                    </c:forEach>

                    <button class="cta" type="submit">
                      <span class="span">确认发货</span>
                      <span class="second">
                        <svg width="50px" height="20px" viewBox="0 0 66 43" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                          <g id="arrow" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <path class="one" d="M40.1543933,3.89485454 L43.9763149,0.139296592 C44.1708311,-0.0518420739 44.4826329,-0.0518571125 44.6771675,0.139262789 L65.6916134,20.7848311 C66.0855801,21.1718824 66.0911863,21.8050225 65.704135,22.1989893 C65.7000188,22.2031791 65.6958657,22.2073326 65.6916762,22.2114492 L44.677098,42.8607841 C44.4825957,43.0519059 44.1708242,43.0519358 43.9762853,42.8608513 L40.1545186,39.1069479 C39.9575152,38.9134427 39.9546793,38.5968729 40.1481845,38.3998695 C40.1502893,38.3977268 40.1524132,38.395603 40.1545562,38.3934985 L56.9937789,21.8567812 C57.1908028,21.6632968 57.193672,21.3467273 57.0001876,21.1497035 C56.9980647,21.1475418 56.9959223,21.1453995 56.9937605,21.1432767 L40.1545208,4.60825197 C39.9574869,4.41477773 39.9546013,4.09820839 40.1480756,3.90117456 C40.1501626,3.89904911 40.1522686,3.89694235 40.1543933,3.89485454 Z" fill="#FFFFFF"></path>
                            <path class="two" d="M20.1543933,3.89485454 L23.9763149,0.139296592 C24.1708311,-0.0518420739 24.4826329,-0.0518571125 24.6771675,0.139262789 L45.6916134,20.7848311 C46.0855801,21.1718824 46.0911863,21.8050225 45.704135,22.1989893 C45.7000188,22.2031791 45.6958657,22.2073326 45.6916762,22.2114492 L24.677098,42.8607841 C24.4825957,43.0519059 24.1708242,43.0519358 23.9762853,42.8608513 L20.1545186,39.1069479 C19.9575152,38.9134427 19.9546793,38.5968729 20.1481845,38.3998695 C20.1502893,38.3977268 20.1524132,38.395603 20.1545562,38.3934985 L36.9937789,21.8567812 C37.1908028,21.6632968 37.193672,21.3467273 37.0001876,21.1497035 C36.9980647,21.1475418 36.9959223,21.1453995 36.9937605,21.1432767 L20.1545208,4.60825197 C19.9574869,4.41477773 19.9546013,4.09820839 20.1480756,3.90117456 C20.1501626,3.89904911 20.1522686,3.89694235 20.1543933,3.89485454 Z" fill="#FFFFFF"></path>
                            <path class="three" d="M0.154393339,3.89485454 L3.97631488,0.139296592 C4.17083111,-0.0518420739 4.48263286,-0.0518571125 4.67716753,0.139262789 L25.6916134,20.7848311 C26.0855801,21.1718824 26.0911863,21.8050225 25.704135,22.1989893 C25.7000188,22.2031791 25.6958657,22.2073326 25.6916762,22.2114492 L4.67709797,42.8607841 C4.48259567,43.0519059 4.17082418,43.0519358 3.97628526,42.8608513 L0.154518591,39.1069479 C-0.0424848215,38.9134427 -0.0453206733,38.5968729 0.148184538,38.3998695 C0.150289256,38.3977268 0.152413239,38.395603 0.154556228,38.3934985 L16.9937789,21.8567812 C17.1908028,21.6632968 17.193672,21.3467273 17.0001876,21.1497035 C16.9980647,21.1475418 16.9959223,21.1453995 16.9937605,21.1432767 L0.15452076,4.60825197 C-0.0425130651,4.41477773 -0.0453986756,4.09820839 0.148075568,3.90117456 C0.150162624,3.89904911 0.152268631,3.89694235 0.154393339,3.89485454 Z" fill="#FFFFFF"></path>
                          </g>
                        </svg>
                      </span>
                    </button>
              </form>

              <div style="float: left;margin-bottom: 5px">
                <label style="color: red">${flag}</label>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--表格end -->
    <!-- 主要内容end -->

  <!-- End: Main -->


  <!-- BEGIN: PAGE SCRIPTS -->

  <!-- jQuery -->
  <script src="../../vendor/jquery/jquery-1.11.1.min.js"></script>
  <script src="../../vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

  <!-- Datatables -->
  <script src="../../vendor/plugins/datatables/media/js/jquery.dataTables.js"></script>

  <!-- Datatables Tabletools addon -->
  <script src="../../vendor/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>

  <!-- Datatables ColReorder addon -->
  <script src="../../vendor/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>

  <!-- Datatables Bootstrap Modifications  -->
  <script src="../../vendor/plugins/datatables/media/js/dataTables.bootstrap.js"></script>

  <!-- Theme Javascript -->
  <script src="../../assets/js/utility/utility.js"></script>
  <script src="../../assets/js/demo/demo.js"></script>
  <script src="../../assets/js/main.js"></script>
  <script type="text/javascript">
    jQuery(document).ready(function () {

      "use strict";

      // Init Theme Core
      Core.init();

      // Init Demo JS
      Demo.init();

      // Init DataTables
      $('#datatable').dataTable({
        "sDom": 't<"dt-panelfooter clearfix"ip>',
        "oTableTools": {
          "sSwfPath": "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
        }
      });

      $('#datatable2').dataTable({
        "aoColumnDefs": [{
          'bSortable': false,
          'aTargets': [-1]
        }],
        "oLanguage": {
          "oPaginate": {
            "sPrevious": "",
            "sNext": ""
          }
        },
        "iDisplayLength": 5,
        "aLengthMenu": [
          [5, 10, 25, 50, -1],
          [5, 10, 25, 50, "All"]
        ],
        "sDom": '<"dt-panelmenu clearfix"lfr>t<"dt-panelfooter clearfix"ip>',
        "oTableTools": {
          "sSwfPath": "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
        }
      });

      $('#datatable3').dataTable({
        "aoColumnDefs": [{
          'bSortable': false,
          'aTargets': [-1]
        }],
        "oLanguage": {
          "oPaginate": {
            "sPrevious": "",
            "sNext": ""
          }
        },
        "iDisplayLength": 5,
        "aLengthMenu": [
          [5, 10, 25, 50, -1],
          [5, 10, 25, 50, "All"]
        ],
        "sDom": '<"dt-panelmenu clearfix"Tfr>t<"dt-panelfooter clearfix"ip>',
        "oTableTools": {
          "sSwfPath": "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
        }
      });

      $('#datatable4').dataTable({
        "aoColumnDefs": [{
          'bSortable': false,
          'aTargets': [-1]
        }],
        "oLanguage": {
          "oPaginate": {
            "sPrevious": "",
            "sNext": ""
          }
        },
        "iDisplayLength": 5,
        "aLengthMenu": [
          [5, 10, 25, 50, -1],
          [5, 10, 25, 50, "All"]
        ],
        "sDom": 'T<"panel-menu dt-panelmenu"lfr><"clearfix">tip',

        "oTableTools": {
          "sSwfPath": "vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
        }
      });

      // Multi-Column Filtering
      $('#datatable5 thead th').each(function () {
        var title = $('#datatable5 tfoot th').eq($(this).index()).text();
        $(this).html('<input type="text" class="form-control" placeholder="Search ' + title + '" />');
      });

      // DataTable
      var table5 = $('#datatable5').DataTable({
        "sDom": 't<"dt-panelfooter clearfix"ip>',
        "ordering": false
      });

      // Apply the search
      table5.columns().eq(0).each(function (colIdx) {
        $('input', table5.column(colIdx).header()).on('keyup change', function () {
          table5
            .column(colIdx)
            .search(this.value)
            .draw();
        });
      });

      // ABC FILTERING
      var table6 = $('#datatable6').DataTable({
        "sDom": 't<"dt-panelfooter clearfix"ip>',
        "ordering": false
      });

      var alphabet = $('<div class="dt-abc-filter"/>').append('<span class="abc-label">Search: </span> ');
      var columnData = table6.column(0).data();
      var bins = bin(columnData);

      $('<span class="active"/>')
        .data('letter', '')
        .data('match-count', columnData.length)
        .html('None')
        .appendTo(alphabet);

      for (var i = 0; i < 26; i++) {
        var letter = String.fromCharCode(65 + i);

        $('<span/>')
          .data('letter', letter)
          .data('match-count', bins[letter] || 0)
          .addClass(!bins[letter] ? 'empty' : '')
          .html(letter)
          .appendTo(alphabet);
      }

      $('#datatable6').parents('.panel').find('.panel-menu').addClass('dark').html(alphabet);

      alphabet.on('click', 'span', function () {
        alphabet.find('.active').removeClass('active');
        $(this).addClass('active');

        _alphabetSearch = $(this).data('letter');
        table6.draw();
      });

      var info = $('<div class="alphabetInfo"></div>')
        .appendTo(alphabet);

      var _alphabetSearch = '';

      $.fn.dataTable.ext.search.push(function (settings, searchData) {
        if (!_alphabetSearch) {
          return true;
        }
        if (searchData[0].charAt(0) === _alphabetSearch) {
          return true;
        }
        return false;
      });

      function bin(data) {
        var letter, bins = {};
        for (var i = 0, ien = data.length; i < ien; i++) {
          letter = data[i].charAt(0).toUpperCase();

          if (bins[letter]) {
            bins[letter]++;
          } else {
            bins[letter] = 1;
          }
        }
        return bins;
      }

      // ROW GROUPING
      var table7 = $('#datatable7').DataTable({
        "columnDefs": [{
          "visible": false,
          "targets": 2
        }],
        "order": [
          [2, 'asc']
        ],
        "sDom": 't<"dt-panelfooter clearfix"ip>',
        "displayLength": 25,
        "drawCallback": function (settings) {
          var api = this.api();
          var rows = api.rows({
            page: 'current'
          }).nodes();
          var last = null;

          api.column(2, {
            page: 'current'
          }).data().each(function (group, i) {
            if (last !== group) {
              $(rows).eq(i).before(
                '<tr class="row-label ' + group.replace(/ /g, '').toLowerCase() + '"><td colspan="5">' + group + '</td></tr>'
              );
              last = group;
            }
          });
        }
      });

      // Order by the grouping
      $('#datatable7 tbody').on('click', 'tr.row-label', function () {
        var currentOrder = table7.order()[0];
        if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
          table7.order([2, 'desc']).draw();
        } else {
          table7.order([2, 'asc']).draw();
        }
      });

      $('#datatable8').DataTable({
        "sDom": 'Rt<"dt-panelfooter clearfix"ip>',
      });

      // MISC DATATABLE HELPER FUNCTIONS

      // Add Placeholder text to datatables filter bar
      $('.dataTables_filter input').attr("placeholder", "Enter Terms...");

    });

    /*js的复选案例*/
    window.onload = function () {
      document.getElementById("mother").onclick = function () {
        var elementById = document.getElementsByName("uid");
        for(var i = 0;i<= elementById.length;i++){
          elementById[i].checked=this.checked;
        }
      }
    }

    /*批量删除*/
    function checkCounts() {
      if(confirm("您确认删除吗?")){
        document.getElementById("form").submit();
      }
    }

    function changeSelect() {
      var select_value = document.getElementById("province").value;
      location.href="${pageContext.request.contextPath}/admin/toAdminIndex?pageNum=1&pageSize="
              +select_value+"&cname=${map.cname}&categoryId=${map.categoryId}";
    }


  </script>
  <!-- END: PAGE SCRIPTS -->

</body>

</html>