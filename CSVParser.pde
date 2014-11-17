import java.io.FileReader;
import java.io.FileNotFoundException;
import java.util.List;

List<String[]> _csvData;

List<String[]> parseWigleData(){
    _csvData = new ArrayList();
    parseWigleCSV("C:/code/WigleWifi.csv");
    return _csvData;
}

void parseWigleCSV(String filePath){
  File file=new File(filePath);
  BufferedReader br=null;
  
  try{
    br=new BufferedReader(new FileReader(file));
    String text=null;
    br.readLine();
    br.readLine();
    
    while((text=br.readLine())!=null){
      String [] subtext = splitTokens(text,",");
      _csvData.add(subtext);
    }
  }catch(FileNotFoundException e){
    e.printStackTrace();
  }catch(IOException e){
    e.printStackTrace();
  }finally{
    try {
      if (br != null){
        br.close();
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
