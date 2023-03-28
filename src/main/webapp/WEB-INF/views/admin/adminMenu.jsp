<%@include file="/WEB-INF/views/include/adminHeader.jsp" %>
<title>Admin Users Manager</title>
<link rel="stylesheet" href="<c:url value="/resources/css/admin-menu.css"/>">
<body>
 <!-- Admin header -->
    <div id="screen-container" class="row">

        <!-- Admin menu vertical -->
        <div class="col-2 p-0 position-relative">
            <a class="container btn container-vertical h-100 rounded-0" href="#logo">
                <img src="<c:url value="/resources/img/Logo.png"/>" alt="logo" class="p-1 w-100">
            </a>
            <!-- Static Main Menu -->
            <ul class="position-absolute list-group w-100">
                <li class="list-group-items bg-light">
                    <button type="button" class="btn btn-outline-success p-4 border-0 w-100 text-start">
                        <i class="pe-2 ti-pie-chart"></i>Overview</button>
                </li>
                <li class="list-group-items bg-light">
                    <button type="button" class="btn btn-outline-success p-4 border-0 w-100 text-start">
                        <i class="pe-2 ti-light-bulb"></i>User</button>
                </li>
                <li class="list-group-items bg-light">
                    <button type="button" class="btn btn-outline-success p-4 border-0 w-100 text-start">
                        <i class="pe-2 ti-briefcase"></i>Product</button>
                </li>
                <li class="list-group-items bg-light">
                    <button type="button" class="btn btn-outline-success p-4 border-0 w-100 text-start">
                        <i class="pe-2 ti-ticket"></i>Voucher</button>
                </li>
                <li class="list-group-items bg-light">
                    <button type="button" class="btn btn-outline-success p-4 border-0 w-100 text-start">
                        <i class="pe-2 ti-agenda"></i>Agent</button>
                </li>
                <li class="list-group-items bg-light">
                    <button type="button" class="btn btn-outline-success p-4 border-0 w-100 text-start">
                        <i class="pe-2 ti-info-alt"></i>Set
                        info</button>
                </li>
            </ul>
        </div>

        <!-- Admin menu horizontal -->
        <div id="admin-menu-header" class="col container-fluid align-items-center d-inline-block">

            <ul class="row container-fluid justify-content-between align-items-center">
                <li class="col header-searchbar">
                    <label>
                        <form class="input-group border rounded-pill align-items-center" action="#" method="post">
                            <i class="ti-search input-group-text searchbar-icon "></i>

                            <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                        </form>
                    </label>
                </li>
                <li class="col-5 header-breadcrumb">
                    <p class="text-center">Admin Dashboard</p>
                </li>
                <li class="col row container-fluid align-items-center justify-content-between header-userinfo">
                    <div
                        class="col-2 container d-flex align-items-center userinfo-notification pe-5 border-end border-1">
                        <a class="text-decoration-none text-secondary position-relative"><i
                                class="fs-5 ti-bell text-center "></i>
                            <span
                                class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </a>

                    </div>

                    <div class="col userinfo-username">
                        <p class="m-0 text-center">Admin Username</p>
                    </div>
                    <div class="col-2 align-items-center userinfo-userlogo me-3 d-flex">
                        <a><img class="d-block rounded-pill"
                                src="https://i.pinimg.com/474x/66/da/e1/66dae117263cc353d351949bcc76e1e4.jpg"
                                alt="concat">
                        </a>
                    </div>

                </li>



            </ul>


        </div>

    </div>
    <!-- Main Content -->
    <div id="admin-menu-content-user" class="row">
        <div class="col-md-2 emptyspace p-0">
        </div>

        <div class="col container content-user-breadcrumb m-3 bg-light">
            <div class="row">
                <div class="col-6 content-user-name h4 ">All users</div>
                <div class="col-6  content-user-filter d-flex justify-content-end align-items-center">
                    <a type="button"><i class="ti-filter p-2"></i>Filter</a>
                    <a type="button"><i class="ti-layout-list-post p-2"></i>Sort</a>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th class="p-3">Name</th>
                                <th class="p-3">Age</th>
                                <th class="p-3">Address</th>
                                <th class="p-3">Salary</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                            <tr>
                                <td class="p-3">John Mayour</td>
                                <td class="p-3">21</td>
                                <td class="p-3">Houston</td>
                                <td class="p-3">1200</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="container d-flex row justify-content-end align-items-center">
                <p class="col-7 text-muted text-end p-0 m-0">Rows per pages:</p>
                <div class="btn-group col-1">
                    <button type="button" class="btn dropdown-toggle p-1" data-bs-toggle="dropdown"
                        aria-expanded="false">7</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">1</a></li>
                        <li><a class="dropdown-item" href="#">2</a></li>
                        <li><a class="dropdown-item" href="#">3</a></li>
                    </ul>
                </div>
                <div class="row col-3 d-flex justify-content-between align-items-center content-user-pageselect">
                    <p class="col-6 m-0 text-muted ">1-7 of 1240</p>
                    <a class="col-3 m-0 text-decoration-none" href=""><i class="ti-arrow-left"></i></a>
                    <a class="col-3 m-0 text-decoration-none" href=""><i class="ti-arrow-right"></i></a>
                </div>
            </div>
        </div>

    </div>
<%@include file="/WEB-INF/views/include/adminFooter.jsp" %>