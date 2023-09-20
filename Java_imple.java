import java.io.File;
import java.io.FileWriter;
import java.util.Scanner;
public class Java_imple 
{    
    public static void main(String args[])
    {
            try
            {
            File img2 = new File("newImg_1.ppm");
            if(img2.createNewFile())
            {
                System.out.println("File Created");
                FileWriter writer = new FileWriter("newImg_1.ppm");
                
                try
                {
                Scanner reader = new Scanner(new File("img1.ppm"));
                writer.write(reader.next() + "\n");
                writer.write(reader.next() + " " + reader.next()  + "\n")  ;
                writer.write(reader.next() + " " + reader.next()  + "\n") ;
                writer.write(reader.next()  + "\n");
                while (reader.hasNext())
                {
                    String t0 = reader.next();      
                    int t1 = Integer.parseInt(t0);
                    t1 = t1 + 10;
                    System.out.println(t1);
                    writer.write(t1 + "\n");
                }
                    System.out.println("complete");
            }
            catch(Exception e)
            {
            System.out.print(e);
        }   
        writer.close();
    }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }

        
    }
}
