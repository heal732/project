package kr.co.vol;

import java.io.BufferedInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import kr.co.vol.dto.Progrm;

public class paser {
	
	 public final static String PHARM_URL = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrSearchWordList?pageNo=";
	 public  int pageNo=1;
	 public  String schSido="";
	 public  String schGugun="";
	 public  String adultPosblAt="";
	 public  String yngbgsPosblAt="";
	 public  String progrmSttusSe="";
	 public  String keyword="";
	 public  String progrmEndde="";
	 public  String progrmBgnde="";
	 public  String numOfRows="";
	 
	    public paser() {
	       
	    }
	    
	    public ArrayList<Progrm> list(int i,String schSido,String schGugun,String adultPosblAt, String yngbgsPosblAt, String keyword,String progrmBgnde,String progrmEndde) {
	    	 try {
	    		 pageNo=i;
	    		 this.schSido=schSido;
	    		 this.schGugun=schGugun;
	    		 this.adultPosblAt=adultPosblAt;
	    		 this.yngbgsPosblAt=yngbgsPosblAt;
	    		 this.keyword=keyword;
	    		 this.progrmBgnde=progrmBgnde;
	    		 this.progrmEndde=progrmEndde;
	    		 this.numOfRows="10";
	    		 ArrayList<Progrm> list=apiParserSearch();
		            return list;
		        } catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }
			return null;
	    }
	    
	    public ArrayList<Progrm> list_numOfRows(String pageNum) {
	    	 try {
	    		 this.numOfRows=pageNum;
	    		 ArrayList<Progrm> list=apiParserSearch();
		            return list;
		        } catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }
			return null;
	    }
	    
	    public Integer total() {
	    	try {
	    		return apiParserSearchTotal();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return 0;
	    }
	    
	    /**
	     * 
	     * @throws Exception
	     */
	    
	    
	    public ArrayList<Progrm> apiParserSearch() throws Exception {
	        URL url = new URL(getURLParam(null));
	 
	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        factory.setNamespaceAware(true);
	        XmlPullParser xpp = factory.newPullParser();
	        BufferedInputStream bis = new BufferedInputStream(url.openStream());
	        xpp.setInput(bis, "utf-8");
	        
	        String tag = null;
	        int event_type = xpp.getEventType();
	        
	        ArrayList<Progrm> list = new ArrayList<Progrm>();
	        Progrm progrm;
	        String progrmRegistNo = "";
	        String gugunCd = "";
	        String nanmmbyNm = "";
	        String progrmBgnde = "";
	        String progrmEndde = "";
	        String progrmSj = "";
	        String progrmSttusSe = "";
	        String sidoCd = "";
	        
	        while (event_type != XmlPullParser.END_DOCUMENT) {
	            if (event_type == XmlPullParser.START_TAG) {
	                tag = xpp.getName();
	            } else if (event_type == XmlPullParser.TEXT) {      	
	                if(tag.equals("gugunCd")){
	                	gugunCd = xpp.getText();	         
	                }
	                if(tag.equals("nanmmbyNm")){
	                	nanmmbyNm = xpp.getText();
	                }	     
	                if(tag.equals("progrmBgnde")){
	                	progrmBgnde = xpp.getText();	         
	                }
	                if(tag.equals("progrmEndde")){
	                	progrmEndde = xpp.getText();
	                }  
	                if(tag.equals("progrmRegistNo")){
	                	progrmRegistNo = xpp.getText();	         
	                }
	                if(tag.equals("progrmSj")){
	                	progrmSj = xpp.getText();
	                }
	                if(tag.equals("progrmSttusSe")){
	                	progrmSttusSe = xpp.getText();
	                }
	                if(tag.equals("sidoCd")){
	                	sidoCd = xpp.getText();
	                }
	            	
	            } else if (event_type == XmlPullParser.END_TAG) {
	                tag = xpp.getName();
	                if (tag.equals("item")) {	              
	              		progrm = new Progrm(gugunCd, nanmmbyNm, progrmBgnde, progrmEndde, progrmRegistNo, progrmSj, progrmSttusSe, sidoCd);
	              		list.add(progrm);
	                }
	            }
	 
	            event_type = xpp.next();
	        }
	  
	        return list;
	    }
	    
	    public Integer apiParserSearchTotal() throws Exception {
	        URL url = new URL(getURLParam(null));
	 
	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        factory.setNamespaceAware(true);
	        XmlPullParser xpp = factory.newPullParser();
	        BufferedInputStream bis = new BufferedInputStream(url.openStream());
	        xpp.setInput(bis, "utf-8");
	        
	        String tag = null;
	        int event_type = xpp.getEventType();
	     	     
	        String totalCount = null;
	        while (event_type != XmlPullParser.END_DOCUMENT) {
	            if (event_type == XmlPullParser.START_TAG) {
	                tag = xpp.getName();
	               
	            } else if (event_type == XmlPullParser.TEXT) {      	
	            	 if(tag.equals("totalCount")){
	            		 totalCount = xpp.getText();	                	  
		                }	      
	            } else if (event_type == XmlPullParser.END_TAG) {
	            	tag = xpp.getName();
	            }
	 
	            event_type = xpp.next();
	        }
	        Integer totalCnt=Integer.parseInt(totalCount);
	        return totalCnt;
	    }
	  

	    
	    private String getURLParam(String search){
	    	String sidoUrl="";
	    	String gugunUrl="";
	    	try {
	    		sidoUrl=URLEncoder.encode(schSido, "UTF-8");
	    		gugunUrl=URLEncoder.encode(schGugun, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        String url = PHARM_URL+pageNo+"&schCateGu=progrmSj&keyword="+keyword+"&schSido="+sidoUrl+"&schSign1="+gugunUrl+"&adultPosblAt="+adultPosblAt+"&yngbgsPosblAt="+yngbgsPosblAt+"&progrmBgnde="+progrmBgnde+"&progrmEndde="+progrmEndde+"&numOfRows="+numOfRows;
	        if(search != null){
	        url = url+"&yadmNm"+search;
	        }
	        return url;
	    }
}
