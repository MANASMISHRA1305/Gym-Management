<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - Fit-Mitra</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar">
    <div class="logo">Fit-Mitra</div>
    <div class="nav-buttons">
      <a href="index.html" class="btn home-btn">Home</a>
      <a href="Login.jsp" class="btn login-btn">Login</a>
    </div>
  </nav>

  <!-- Register Section -->
  <div class="form-section">
    <h1>Register</h1>
    <p>Create your Fit-Mitra account</p>
    
    <!-- Error Display -->
    <%
      String error = request.getParameter("error");
      if (error != null) {
          switch (error) {
              case "InvalidUsername":
                  out.println("<p style='color: red;'>Username must be at least 3 characters long.</p>");
                  break;
              case "InvalidPassword":
                  out.println("<p style='color: red;'>Password must be at least 6 characters long.</p>");
                  break;
              case "InvalidEmail":
                  out.println("<p style='color: red;'>Enter a valid email address.</p>");
                  break;
              case "InvalidPhoneNumber":
                  out.println("<p style='color: red;'>Enter a valid 10-digit contact number.</p>");
                  break;
              case "InvalidPlan":
                  out.println("<p style='color: red;'>Subscription plan cannot be empty.</p>");
                  break;
              case "InvalidDiet":
                  out.println("<p style='color: red;'>Diet plan cannot be empty.</p>");
                  break;
              case "DatabaseError":
                  out.println("<p style='color: red;'>Registration failed. Please try again later.</p>");
                  break;
              default:
                  out.println("<p style='color: red;'>An unknown error occurred. Please try again.</p>");
          }
      }
    %>

    <form action="RegisterServlet" method="post" class="form-container" id="registerForm">
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>

      <label for="plan">Enter your subscription plan:</label>
      <input type="text" id="plan" name="plan" required>
      
      <label for="diet">Enter your diet plan:</label>
      <input type="text" id="diet" name="diet" required>

      <label for="number">Enter your Contact no:</label>
      <input type="text" id="number" name="number" required>

      <button type="submit" class="btn submit-btn">Register</button>
    </form>
    <p>Already have an account? <a href="Login.jsp">Login here</a></p>
  </div>

  <!-- JavaScript Validation -->
  <script>
    const form = document.getElementById('registerForm');

    form.addEventListener('submit', (e) => {
      const username = document.getElementById('username').value.trim();
      const email = document.getElementById('email').value.trim();
      const password = document.getElementById('password').value.trim();
      const plan = document.getElementById('plan').value.trim();
      const diet = document.getElementById('diet').value.trim();
      const number = document.getElementById('number').value.trim();

      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const phoneRegex = /^[0-9]{10}$/;

      if (username.length < 3) {
        alert('Username must be at least 3 characters long.');
        e.preventDefault();
        return;
      }

      if (!emailRegex.test(email)) {
        alert('Enter a valid email address.');
        e.preventDefault();
        return;
      }

      if (password.length < 6) {
        alert('Password must be at least 6 characters long.');
        e.preventDefault();
        return;
      }

      if (!phoneRegex.test(number)) {
        alert('Enter a valid 10-digit contact number.');
        e.preventDefault();
        return;
      }

      if (plan === '' || diet === '') {
        alert('Please fill out all fields.');
        e.preventDefault();
        return;
      }
    });
  </script>
</body>
</html>
