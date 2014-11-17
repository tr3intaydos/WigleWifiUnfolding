import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*; 
import de.fhpotsdam.unfolding.marker.*;

UnfoldingMap map;

List<String[]> csvData; 

void setup() {
  size(800, 600);
  csvData = new ArrayList();
  csvData = parseWigleData();

  map = new UnfoldingMap(this);
  
  for (int i=0; i<csvData.size()-1; i++){
   String [] wifiLocation = csvData.get(i);
   map.addMarkers(new SimplePointMarker(new Location(Float.parseFloat(wifiLocation[6]), Float.parseFloat(wifiLocation[7]))));
  }
  MapUtils.createDefaultEventDispatcher(this, map);
  map.zoomAndPanTo(new Location(Float.parseFloat(csvData.get(0)[6]), Float.parseFloat(csvData.get(0)[7])), 14);

}
 
void draw() {
  map.draw();
}
