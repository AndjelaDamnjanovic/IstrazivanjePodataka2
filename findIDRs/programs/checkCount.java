import java.io.*;

public class Main {
    public static void main(String[] args) {
        int br=0;
        try {
            BufferedReader in=new BufferedReader(new InputStreamReader(new FileInputStream("podaci.fasta")));
            String line;

            while((line=in.readLine())!=null){
                if(line.trim().startsWith(">"))
                    br++;
            }
            System.out.println(br);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}