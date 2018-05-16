import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KUPS
 */

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
@MultipartConfig
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String username = request.getParameter("username");
           String password = request.getParameter("password");
           String firstname = request.getParameter("firstname");
           String lastname = request.getParameter("lastname");
           String contact = request.getParameter("contact_number");
           String address = request.getParameter("address");
            try{
               if(username!=null){
                   Class.forName("com.mysql.jdbc.Driver").newInstance();
                   Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root" , "");
                   String query = "select * from user WHERE user_name=? and password=?";
                   PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);
                   pst.setString(1, username);
                   pst.setString(2, password);

                   
                   ResultSet rs = pst.executeQuery();
                   out.println("username: " + username);
                   if(rs.next()){
                       HttpSession session = request.getSession();
                       session.setAttribute("firstname", rs.getString("firstname"));
                       session.setAttribute("lastname", rs.getString("lastname"));
                       session.setAttribute("contact_number", rs.getString("contact_num"));
                       session.setAttribute("address", rs.getString("address"));
                       session.setAttribute("userid", rs.getString("id_no"));
                       
                       response.sendRedirect("home.jsp");
                   }else{
                       response.sendRedirect("login.jsp");
                   }
                   
               }
           }catch(IOException | ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException ex){
               out.println("Exception :" + ex.getMessage());
           }
        }
    }



}
