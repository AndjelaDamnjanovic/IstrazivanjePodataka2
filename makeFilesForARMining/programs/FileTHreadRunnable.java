import java.io.*;

public class FileTHreadRunnable extends Thread {
    private BufferedReader in;
    private int id;
    private int start;
    private int lines_to_read;
    public FileTHreadRunnable(BufferedReader in, int id, int start, int lines_to_read) {
        this.id=id;
        this.in=in;
        this.lines_to_read=lines_to_read;
        this.start=start;

        StringBuilder sb=new StringBuilder();
        sb.append("direct3");
        sb.append(id+1);
        sb.append(".fasta.load");
        try (BufferedWriter out=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(sb.toString())));){
            String line;
            for(int i=0;i<lines_to_read;i++){
                if((line=in.readLine())!=null)
                    out.write(line+"\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}