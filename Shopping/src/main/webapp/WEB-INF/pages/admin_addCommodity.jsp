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
                <span class="glyphicon glyphicon-tasks"></span>商品信息
              </div>
              <div style="float: left;margin-bottom: 5px">
                <form class="form-inline" action="${pageContext.request.contextPath}/admin/addCommodity" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                    <label >商品名称</label>
                    <input type="text" class="form-control" name="name" id="name">
                  </div>
                  商品种类
                  <select name="categoryId" class="input-select">
                    <c:forEach items="${categoryMap}" var="category" varStatus="x">
                      <option value="${category.key}">${category.value}</option>
                    </c:forEach>
                  </select>
                  <br>
                  <%--文件上传框--%>

                  <div class="form-group">
                    <label>商品封面</label>
                    <span id="imgName"></span><br>
                    <input type="file" name="photo" id="photoUrl" onchange="fileChange()"/>
                  </div>
                  <br>
                  <div class="form-group">
                    <label >商品价格</label>
                    <input type="number" class="form-control" name="price" min="0.01" id="price">
                  </div>
                  <div class="form-group">
                    <label >商品库存</label>
                    <input type="number" class="form-control" name="inventory" min="0" id="inventory">
                  </div>
                  <div class="form-group">
                    <label >商品折扣</label>
                    <input type="number" class="form-control" name="discount" id="discount" min="1" max="10" step="1">折
                  </div>
                  <div class="form-group">
                    <label>商品描述</label> <br>
                    <textarea name="description" class="form-control" style="width: 900px;height: 200px">

                    </textarea>
                  </div>
                  <div class="form-group">
                    <label>商品细节</label> <br>
                    <textarea name="details" class="form-control" style="width: 900px;height: 200px">
                    </textarea>
                  </div>
                  <br>
                  <button type="submit" class="btn btn-default">确认新增</button>
                </form>
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