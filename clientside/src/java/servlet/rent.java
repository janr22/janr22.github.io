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
public class rent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String status = request.getParameter("changeStatus");
        String car_id = request.getParameter("carid");
        String user_id = request.getParameter("userid");
        PrintWriter pw = response.getWriter();

        if(status.equalsIgnoreCase("Rent")){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root" , "");
                  String query = "UPDATE cars set status=? where car_id=?";

                   PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);

                   pst.setString(1, "Rented");
                   pst.setString(2, car_id);


                   int rs = pst.executeUpdate();

                    if(rs > 0){
                        //without referencial integrity
                        query = "INSERT into rent(user_id,car_id) values(?,?)";    
                        pst = (PreparedStatement) conn.prepareStatement(query);
                        
                        pst.setString(1,user_id);
                        pst.setString(2, car_id);
                        
                        rs = pst.executeUpdate();
                        
                        if (rs>0) {
                            response.sendRedirect("home.jsp");    
                        }
                        else {
                                System.out.println("Error!");
                                }
                        
                    }else{
                        System.out.println("Error!");
                    }
                   
            } catch (IOException | ClassNotFoundException | SQLException ex) {
                Logger.getLogger(rent.class.getName()).log(Level.SEVERE, null, ex);
            }
              
            
           
            
            
        } else if (status.equalsIgnoreCase("Cancel")) {
             try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root" , "");
                   
                   String query = "SELECT * FROM rent WHERE car_id=? AND user_id=?"; 
                   PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);
                   
                   pst.setString(1, car_id);
                   pst.setString(2, user_id);
                   
                   int rs = pst.executeUpdate();
                   
                   if(rs > 0){
                   
                   query = "UPDATE cars set status=? where car_id=?";
                   pst = (PreparedStatement) conn.prepareStatement(query);
                   
                   pst.setString(1, "Available");
                   pst.setString(2, car_id);
                   
                   rs = pst.executeUpdate();
                   
                    if(rs > 0){
                        
                        query = "DELETE FROM rent WHERE car_id=? AND user_id=?"; 
                        pst = (PreparedStatement) conn.prepareStatement(query);
                   
                        pst.setString(1, car_id);
                        pst.setString(2, user_id);
                   
                        rs = pst.executeUpdate();
                        
                        if (rs>0) {
                        response.sendRedirect("home.jsp"); }
                    }
                   }
                   
            } catch (IOException | ClassNotFoundException | SQLException ex) {
                Logger.getLogger(rent.class.getName()).log(Level.SEVERE, null, ex);
            }
        }   
            
        
    }
    

    

}
