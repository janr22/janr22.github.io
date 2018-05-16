import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
@MultipartConfig
public class registerServlet extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter(); 
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String contact = request.getParameter("contact_number");
        String address = request.getParameter("address");
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection connection;
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root", "");
                        
            PreparedStatement ps;
            ps = connection.prepareStatement("INSERT INTO user(user_name, password, firstname, lastname, contact_num, address) values(?,?,?,?,?,?)");
            

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setString(5, contact);
            ps.setString(6, address);
            
           
            
            int rs = ps.executeUpdate();
            
            if(rs > 0){
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("Failed!");
            }

    }   catch (ClassNotFoundException ex) {
        
    }   catch (SQLException ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

