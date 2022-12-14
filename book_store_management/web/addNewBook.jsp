<%@page import="com.prj.tblbook.TblBookError"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Admin Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/addNewBook.css">
    </head>

    <body class="text-center">
        <div class="head sticky-top">
            <div style="width: 100px">
                <a href="DispatchController?btnAction=ShowAllBook">
                    <img src="image/Pngtre.png" alt="" class="image" style="width: 100%">  
                </a>
            </div>
            <div class="admin">
                <label class="link"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="30" fill="currentColor"
                                         class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                    <path
                        d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
                    </svg>
                    Admin</label>
                <a class="link" href="DispatchController?btnAction=Logout">Log out</a>
            </div>
            <a class="link" href="DispatchController?btnAction=ShowAllBook">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-book-fill"
                     viewBox="0 0 16 16">
                <path
                    d="M8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
                </svg>
                List Book
            </a>
        </div>
        <%--
            TblBookError bookError = (TblBookError) request.getAttribute("BOOK_ERROR");
            if (bookError == null) {
                bookError = new TblBookError();
            }
        --%>
        <div>


            <c:set var="bookError" value="${requestScope.BOOK_ERROR}"/>
            <div>
                <h3 style="margin-top: 50px">
                    Create new Book
                </h3>
            </div>
            <form class="form" action="DispatchController">
                <div class="form-floating">
                    <input required type="text" name="txtBookID" value="${param.txtBookID}" class="form-control" id="formInputName" placeholder="input">
                    <label for="formInputBookID">*Book ID</label>
                </div>
                <div class="error text-danger text-left">
                    <c:if test="${not empty bookError}">
                        ${bookError.bookIDError}    <%--= bookError.getBookIDError()--%>
                    </c:if>      
                </div>

                <div class="form-floating">
                    <input required type="text" name="txtBookName" value="${param.txtBookName}" class="form-control" id="formInputName" placeholder="input">
                    <label for="formInputName">*Name Book</label>
                </div>
                <div class="error text-danger text-left">
                    <c:if test="${not empty bookError}">
                        ${bookError.bookNameError}<%--= bookError.getBookNameError()--%>
                    </c:if>
                </div>
                <div class="form-floating">
                    <input required type="text" name="txtQuantity" pattern="[0-9]+" value="${param.txtQuantity}" class="form-control" id="formInputQuantity" placeholder="input">
                    <label for="formInputQuantity">*Quantity</label>
                </div>
                <div class="error text-danger text-left">
                    <c:if test="${not empty bookError}">
                        ${bookError.quantityError} <%--= bookError.getQuantityError()--%>
                    </c:if>
                </div>

                <div class="form-floating">
                    <input required type="text" name="txtPrice" pattern="[0-9]+" value="${param.txtPrice}" class="form-control" id="formInputPrice" placeholder="input">
                    <label for="formInputPrice">*Price</label>
                </div>
                <div class="error text-danger text-left">
                    <c:if test="${not empty bookError}">
                        ${bookError.priceError} <%--= bookError.getPriceError()--%>
                    </c:if>
                </div>

                <div class="form-floating">
                    <input required type="text" name="txtImagePath" value="${param.txtImagePath}" class="form-control" id="formInputPrice" placeholder="input">
                    <label for="formInputImagePath">*Image path</label>
                </div>
                <div class="error text-danger text-left">
                    <c:if test="${not empty bookError}">
                        ${bookError.imagePathError} <%--= bookError.getImagePathError()--%>
                    </c:if>
                </div>         
                <div class="error text-danger text-left">
                    <c:if test="${not empty bookError}">
                        ${bookError.messageError}<%--= bookError.getMessageError()--%>
                    </c:if>
                </div>

                <button class="btn btn-outline-primary" type="submit" value="SignUpBook" name="btnAction">
                    Create
                </button>
                <!--<input class="btn btn-outline-primary" type="submit" name="btnAction" value="SignUpBook" />-->         
                <input class="btn btn-outline-primary" type="reset" value="Reset">
            </form>
        </div>
    </body>