package com.org.CRMUniq.service.securityseervice;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.org.CRMUniq.Repo.AllUsersRepo;
import com.org.CRMUniq.model.AllUsers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    AllUsersRepo allUsersRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        String username = authentication.getName();
        AllUsers user = allUsersRepository.findByuname(username);
        
        // Save the user object in the session 
        HttpSession session = request.getSession();
        session.setAttribute("User", user);
        
        // Redirect to default success URL
        String uRole = user.getRole();
        switch (uRole.toLowerCase()) {
            case "admin":
                response.sendRedirect("/AdminHome");
                break;
            case "manager":
                response.sendRedirect("/Managerhome");
                break;
            case "salesuser":
                response.sendRedirect("/SalesUserHome");
                break;
            default:
                response.sendRedirect("/defaultHome"); // Default redirect if role is unknown
                break;
        }
    }
}
