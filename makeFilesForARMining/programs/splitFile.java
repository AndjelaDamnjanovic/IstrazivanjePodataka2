import java.io.*;

import static java.lang.Math.ceil;
import static java.lang.Math.min;

public class splitFile {
    public static void main(String [] args){
        try(BufferedReader in= new BufferedReader(new InputStreamReader(new FileInputStream("direct3.fasta.load")))) {
            int num_of_threads=8;
            double num_of_lines=408546;
            int step=(int) ceil(num_of_lines/num_of_threads);
            for (int i=0;i<num_of_threads;i++){
                //svakoj niti prosledjujemo fajl iz kog cita, koji je njen redni br, poziciju pocetka citanja i koliko linija cita
                Thread t=new FileTHreadRunnable(in, i, i*step+1, min(step, (int)num_of_lines-i*step));
                t.start();
                t.join();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}