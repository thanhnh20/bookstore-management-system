<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

    <head>
        <title>Order Detail Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link rel="stylesheet" href="css/cartList.css">
    </head>

    <body class="text-center">
        <c:set var="account" value="${sessionScope.USER_ROLE}"/>
        <div class="head sticky-top">
            <div style="width: 100px">
                <a href="DispatchController?btnAction=ShowListBookAsUser">
                    <img src="image/Pngtre.png" alt="" class="image" style="width: 100%">  
                </a>
            </div>
            <div class="user">
                <a class="link" href="DispatchController?btnAction=ShowProfile"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="30" fill="currentColor"
                                                                                     class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                    <path
                        d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
                    </svg>
                    ${account.fullName}</a>
                <a class="link" href="DispatchController?btnAction=Logout">Log out</a>
            </div>
            <a class="link" href="DispatchController?btnAction=ShowListBookAsUser">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="30" fill="currentColor" class="bi bi-cart3"
                     viewBox="0 0 16 16">
                <path
                    d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </svg>
                Buy book
            </a>
        </div>

        <c:set var="listOrderDetail" value="${requestScope.LIST_ORDER_DETAIL}"/> 
        <c:set var="order" value="${requestScope.ORDER}"/>
        <c:set var="amount" value="${requestScope.AMOUNT}"/>
        <c:if test="${not empty listOrderDetail}">
            <div class="text-center" style="margin-top: 40px">
                <h4>
                    Order history
                </h4>
            </div>
            <div style="width: 30%; margin-left: 300px; text-align: left">
                <div>
                    <h6>
                        Order ID: ${order.orderID}
                    </h6>
                </div>
                <div>
                    <h6>
                        Purchase Date: ${order.purchaseDate}
                    </h6>           
                </div>
                <div>
                    <h6>
                        Amount: <font class="text-danger">${amount}$</font>
                    </h6>
                </div>
            </div>
            <div class="book-list">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>NO.</th>
                            <th>Book Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderDetail" items="${listOrderDetail}" varStatus="count">
                            <tr>
                                <td>
                                    ${count.count}
                                </td>
                                <td>
                                    ${orderDetail.book.bookName}
                                </td>
                                <td>
                                    ${orderDetail.book.price}
                                </td>
                                <td>
                                    ${orderDetail.quantity}
                                </td>
                                <td>
                                    ${orderDetail.totalPrice}
                                </td>
                            </tr>   
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div>
                <a href="DispatchController?btnAction=ShowOrderHistory" class="btn btn-primary">
                    Back to Order history
                </a>
            </div>
        </c:if>
    </body>