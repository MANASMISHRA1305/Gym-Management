<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Fit-Mitra</title>
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>
    <nav class="navbar">
        <div class="logo">Fit-Mitra</div>
        <div class="nav-buttons">
            <a href="index.html" class="btn home-btn">Home</a>
            <a href="logout.jsp" class="btn logout-btn">Logout</a>
        </div>
    </nav>

    <%
        HttpSession session3 = request.getSession(false);
        if (session != null && session3.getAttribute("username") != null) {
            String username = (String) session3.getAttribute("username");
            String diet = (String) session3.getAttribute("diet");
            String plan = (String) session3.getAttribute("plan");
            String number = (String) session3.getAttribute("number");
    %>
        <section class="dashboard-section">
            <h1>Welcome, <%= username %></h1>
            <div class="dashboard-info">
                <div class="info-card">
                    <h2>Your Contact Number</h2>
                    <p><%= number %></p>
                </div>
                <div class="info-card">
                    <h2>Your Membership Plan</h2>
                    <p><%= plan %></p>
                </div>
                <div class="info-card">
                    <h2>Your Diet Plan</h2>
                    <p><%= diet %></p>
                </div>
            </div>
             <!-- Image Section -->
    <div class="image-section">
      <h2>Fit-Mitra</h2>
      <img src="Assets/Fit-mitra.png" alt="Logo">
    </div>
        </section>
    <%
        } else {
            response.sendRedirect("Login.jsp");
        }
    %>
</body>
</html>
