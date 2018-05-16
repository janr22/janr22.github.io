import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kupal
 */
public class rentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String status = request.getParameter("changeStatus");
        String idno = request.getParameter("id");
        PrintWriter pw = response.getWriter();

        if(status.equalsIgnoreCase("Rent")){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root" , "");
                  // String query = "UPDATE cars set status=?, date=now() where car_id=?";
                  String query = "UPDATE cars set status=?, date=now() where car_id=?";

                   PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);

                   pst.setString(1, "Rented");
                   pst.setString(2, idno);



                   int rs = pst.executeUpdate();

                    if(rs > 0){

                        response.sendRedirect("cars.jsp");
                        
                    }else{
                        System.out.println("Error!");
                    }
                   
            } catch (IOException | ClassNotFoundException | SQLException ex) {
                Logger.getLogger(rentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
              
            
           
            
            
        } else if (status.equalsIgnoreCase("Cancel")) {
             try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root" , "");
                   String query = "UPDATE cars set status=?, date=0000-00-00  where car_id=?";
                   PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);
                   
                   pst.setString(1, "Available");
                   pst.setString(2, idno);
                   
                   int rs = pst.executeUpdate();
                   
                    if(rs > 0){
                        response.sendRedirect("cars.jsp");
                    }
                   
            } catch (IOException | ClassNotFoundException | SQLException ex) {
                Logger.getLogger(rentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }   
            
        
    }
    

    

}
