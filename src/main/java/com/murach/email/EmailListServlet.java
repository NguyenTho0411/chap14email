/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.murach.email;

import com.murach.data.UserDB;
import com.murach.entity.User;
import com.murach.util.MailUtilLocal;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



/**
 *
 * @author DELL
 */
@WebServlet(name = "EmailListServlet", urlPatterns = {"/emailList"})
public class EmailListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // perform action and set URL to appropriate page
        String url = "/index.jsp";        
        if (action.equals("join")) {
            url = "/index.jsp";    // the "join" page
        } 
        else if (action.equals("add")) {
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // store data in User object
            User user = new User(firstName, lastName, email);
            UserDB.insert(user);
            request.setAttribute("user", user);
            
            // send email to user
            String to = email;
            String from = "nguyenhuuductho0411@gmail.com";
            String subject = "Welcome to our email list";
            String body = "Dear " + firstName + ",\n\n" +
                "Thanks for joining our email list. We'll make sure to send " +
                "you announcements about new products and promotions.\n" +
                "Have a great day and thanks again!\n\n" +
                "Kelly Slivkoff\n" +
                "Mike Murach & Associates\n"
                    + "From student: Nguyen Huu Duc Tho, Student ID:22110237";
            boolean isBodyHTML = false;

            try
            {
                MailUtilLocal.sendMail(to, from, subject, body, isBodyHTML);
//                MailUtilGmail.sendMail(to,from,subject,body,isBodyHTML);
            }
            catch(MessagingException e)
            {
                String errorMessage = 
                    "ERROR: Unable to send email. " + 
                        "Check Tomcat logs for details.<br>" +
                    "NOTE: You may need to configure your system " + 
                        "as described in chapter 14.<br>" +
                    "ERROR MESSAGE: " + e.getMessage();
                request.setAttribute("errorMessage", errorMessage);
                this.log(
                    "Unable to send email. \n" +
                    "Here is the email you tried to send: \n" +
                    "=====================================\n" +
                    "TO: " + email + "\n" +
                    "FROM: " + from + "\n" +
                    "SUBJECT: " + subject + "\n" +
                    "\n" +
                    body + "\n\n");
            }            
            url = "/thanks.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

}
