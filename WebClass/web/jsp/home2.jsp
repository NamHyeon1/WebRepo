<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script>
        function menu_over(e) {
            e.setAttribute("class", "nav-item active");
        }
        function menu_out(e) {
            e.setAttribute("class", "nav-item");
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <%@ include file="menu.jsp" %>
            <form id="LoginForm" class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="ID" aria-label="ID" id="id" required>
                <input class="form-control mr-sm-2" type="password" placeholder="PWD" aria-label="PWD" id="pwd" required>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
            </form>
        </div>
    </nav>

    <div class="bodyCon">
        <h1>Hello, world!</h1>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</p>
    </div>

    <%@ include file="footer.jsp" %>

    <%@ include file="modal.jsp" %>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $("#LoginForm").submit(function () {
                // submit이 자동으로 되는 기능을 막기
                event.preventDefault();

                // id, pwd를 가져오기
                var id = $("#id").val();
                var pwd = $("#pwd").val();
                console.log("id : " + id + "\npwd : " + pwd);

                // 서버로 post 전송 (ajax)
                $.post("/LoginServlet", { "id" : id, "pwd" : pwd },
                    function(data) {
//                        alert(data.form.id + '님 로그인되었습니다.');
                        var myModal = $('#myModal');
                        myModal.modal();
                        myModal.find('.modal-body').text(data.id + '님 로그인되었습니다.');
                    });          // post방식으로 저 사이트에 post를 보내는데 json형식으로 입력한 값이 들어감

            });
        });

        // 간단하게 쓰기
        $(function() {

        });

    </script>

</body>
</html>