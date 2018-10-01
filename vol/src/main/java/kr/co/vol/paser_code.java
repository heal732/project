package kr.co.vol;

import java.io.BufferedInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;


import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import kr.co.vol.dto.Code;

public class paser_code {
	 public final static String PHARM_URL = "http://openapi.1365.go.kr/openapi/service/rest/CodeInquiryService/getAreaCodeInquiryList?";
	 public int pageNo=1;
	 public String schSido="";
	 public String schGugun="";
	 public Integer gugun_id=1;
	    public paser_code() {
	       
	    }

		public Code getCode(String schSido,String schGugun) {
	    	 try {
	    		 this.schSido=schSido;
	    		 this.schGugun=schGugun;
		            return apiParserSearch();
		        } catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }
			return null;
	    }
	    
	    public ArrayList<String> getlist(int i,String schSido) {
	    	 try {
	    		 this.schSido=schSido;
	    		 this.pageNo=i+1;
	    	
		          return apiParserListgugun();
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
	    public Code apiParserSearch() throws Exception {
	        URL url = new URL(getURLParam(null));
	 
	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        factory.setNamespaceAware(true);
	        XmlPullParser xpp = factory.newPullParser();
	        BufferedInputStream bis = new BufferedInputStream(url.openStream());
	        xpp.setInput(bis, "utf-8");
	        
	        String tag = null;
	        int event_type = xpp.getEventType();
	        Code code=null;
	        String sidoCd="";
	        String gugunCd="";
	        while (event_type != XmlPullParser.END_DOCUMENT) {
	            if (event_type == XmlPullParser.START_TAG) {
	                tag = xpp.getName();
	            } else if (event_type == XmlPullParser.TEXT) {      	
	                if(tag.equals("gugunCd")){
	                	gugunCd = xpp.getText();	         
	                }
	                if(tag.equals("sidoCd")){
	                	sidoCd = xpp.getText();
	                }	     
	
	            } else if (event_type == XmlPullParser.END_TAG) {
	                tag = xpp.getName();
	                if (tag.equals("item")) {	              
	            	         code=new Code(sidoCd,gugunCd);	            	   
	                }
	            }
	 
	            event_type = xpp.next();
	        }
	        return code;
	     
	    }
	    
	    public ArrayList<String> apiParserListgugun() throws Exception {
	        URL url = new URL(getURLParam(null));
	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        factory.setNamespaceAware(true);
	        XmlPullParser xpp = factory.newPullParser();
	        BufferedInputStream bis = new BufferedInputStream(url.openStream());
	        xpp.setInput(bis, "utf-8");
	        
	        String tag = null;
	        int event_type = xpp.getEventType();
	        String gugunNm = null;
	        ArrayList<String> list= new ArrayList<String>();
	        while (event_type != XmlPullParser.END_DOCUMENT) {
	            if (event_type == XmlPullParser.START_TAG) {
	                tag = xpp.getName();
	            } else if (event_type == XmlPullParser.TEXT) {
	            	 if(tag.equals("gugunNm")){
	            		 gugunNm = xpp.getText();	
		                }	             	
	            } else if (event_type == XmlPullParser.END_TAG) {
	            	tag = xpp.getName();
	            	 if (tag.equals("item")) {	              
	            		 list.add(gugunNm);
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
	        String url = PHARM_URL+"pageNo="+pageNo+"&schSido="+sidoUrl+"&schSign1="+gugunUrl;
	        if(search != null){
	        url = url+"&yadmNm"+search;
	        }
	        return url;
	    }
}
