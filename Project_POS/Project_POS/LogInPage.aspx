<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="POS_system.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="LogInPage.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"/>
    
    <title>Log In</title>
</head>
<body class="container-sm">
    
       <section class="vh-100">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-8 text-black">

        <div class="px-5 ms-xl-4">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
          <img src="https://financesonline.com/uploads/2020/02/CureMD-logo-1-1.png"
          alt="Login image"  />
        </div>

        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

          <form runat="server" style="width: 23rem;">

            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log in</h3>

            <div class="form-outline mb-4">
              <input type="text" id="userName" class="form-control form-control-lg" runat="server"/>
              <label class="form-label" for="userName">Username</label>
            </div>

            <div class="form-outline mb-4">
              <input type="password" id="pass" class="form-control form-control-lg" runat="server" />
              <label class="form-label" for="pass">Password</label>
            </div>

            <div class="pt-1 mb-4">
                <p id="invalid_login" runat="server" style="color:red;"></p>
                <asp:Button CssClass="btn btn-info btn-lg btn-block" ID="loginbtn" OnClick="loginbtn_Click" runat="server" Text="Login" />             
            </div>
          </form>
        </div>
      </div>
      <div class="col-sm-4 px-0 d-none d-sm-block">
      <img src="https://wallpapercave.com/wp/wp3228715.jpg"
          alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;"/>
      </div>
    </div>
  </div>
</section>
    
</body>
</html>
