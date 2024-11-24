<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Fit-Mitra</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <!-- Navigation Bar -->
  <nav class="navbar">
    <div class="logo">Fit-Mitra</div>
    <div class="nav-buttons">
      <a href="index.html" class="btn home-btn">Home</a>
      <a href="Register.jsp" class="btn register-btn">Register</a>
    </div>
  </nav>

  <!-- Login Section -->
  <div class="form-section">
    <h1>Login</h1>
    <p>Access your Fit-Mitra account</p>
    <form action="LoginServlet" method="post" class="form-container">
      <label for="username">Email:</label>
      <input type="text" id="username" name="username" required>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>

      <button type="submit" class="btn submit-btn">Login</button>
    </form>
    <p>Don't have an account? <a href="Register.jsp">Register here</a></p>
    <!-- Display error -->
    <%
    String error = request.getParameter("error");
    if (error != null && error.equals("1")) { %>
    <p style="color: red;">Invalid username or password. Please try again.</p>
	<% } %>
	 <!-- Display success -->
	 <% String rs = request.getParameter("registration");
            if (rs != null && rs.equals("success")) { %>
                <p style="color: green;">Your Registration is Successful. Please Login.</p>
        <% } %>
  </div>

</body>
</html>