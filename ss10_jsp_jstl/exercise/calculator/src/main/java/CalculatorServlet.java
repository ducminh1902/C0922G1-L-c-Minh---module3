import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet" , urlPatterns = {"/calculator"})
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int firstNumber = Integer.parseInt(request.getParameter("firstNumber"));
         int secondNumber = Integer.parseInt(request.getParameter("secondNumber"));
         String selector = request.getParameter("selector");
         int result = 0;
         switch (selector){
             case "Addition(+)":
                result =  firstNumber + secondNumber;
                break;
             case "Subtraction (-)":
                 if (firstNumber < secondNumber){
                     throw new  ArithmeticException("Ngáo àhhh");
                 }
                 result = firstNumber - secondNumber;
                 break;
             case "Multiplication (x)":
                 result = firstNumber * secondNumber;
                 break;
             case "Division (/)":
                 if (secondNumber == 0){
                     throw new  ArithmeticException("Ngáo àhhh");
                 }
                 result = firstNumber / secondNumber;
                 break;
         }
         request.setAttribute("result",result);
         request.getRequestDispatcher("result.jsp").forward(request,response);
   
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
