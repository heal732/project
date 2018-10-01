<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap AdminPage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
  <link rel="stylesheet" href="../css/admin.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
      height: 10%;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 10px;
      }
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-sx sidenav">
      <h4>관리자페이지</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Home</a></li>
        <li><a href="./adnotice/noticeList.do">공지사항관리</a></li>
        <li><a href="#section3">Q&A답변</a></li>
        <li><a href="./admember/mmanage.do">회원관리</a></li>
        <li><a href="#section5">게시글관리</a></li>
        <li><a href="#section6">공연장관리</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9">

      <form role="form">
        <div class="form-group">
        <h6>TICKET 관리자페이지에 입장하셨습니다.</h6>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
      </form>
      <br><br>
      
      <div class="row">
        <div class="col-sm-2 text-center">
        </div>
        <div class="col-sm-10">
        </div>
        <div class="col-sm-2 text-center">
        </div>
        <div class="col-sm-10">
          <div class="row">
            <div class="col-sm-2 text-center">
            </div>
            <div class="col-xs-10">
  
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid">
  <p>Ticket</p>
</footer>

</body>
</html>
