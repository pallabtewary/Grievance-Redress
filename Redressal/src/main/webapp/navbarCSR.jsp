<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="csrdashboard">Welcome CSR</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <h6 style="color: white"> ${sessionScope.validUser.getFirstname()} ${sessionScope.validUser.getLastname()}</h6>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="login.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="csrdashboard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <a class="nav-link" href="customers">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Customers
                            </a> 
                            <div class="sb-sidenav-menu-heading">Services</div>
                            <!-- <a class="nav-link" href="cusdefects.action">
                                <div class="sb-nav-link-icon"><i class="fas fa-bug"></i></div>
                                Customer Defects
                            </a>     -->                      
                            <a class="nav-link" href="complaint">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Complaints
                            </a>
                            <a class="nav-link" href="department.action">
                                <div class="sb-nav-link-icon"><i class="fas fa-sitemap"></i></div>
                                Departments
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">My Account</div>
                            <a class="nav-link" href="profile.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                Profile
                            </a>
                            <a class="nav-link" href="logout">
                                <div class="sb-nav-link-icon"><i class="fas fa-sign-out-alt"></i></div>
                                logout
                            </a>
                            
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        CSR
                    </div>
                </nav>
            </div>