package kr.co.vol;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import kr.co.vol.dto.Progrm;
import kr.co.vol.dto.ProgrmInfo;

public class paser2 {
	 public final static String PHARM_URL = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrPartcptnItem?progrmRegistNo=";
	 public static String progrmRegistNo="";
	    public paser2() {
	       
	    }
	    
	    public ProgrmInfo Info(String i) {
	    	 try {
	
	    		 progrmRegistNo=i;
		            return apiParserSearch();
		        } catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        }
			return null;
	    }
	
	    
	    /**
	     * 
	     * @throws Exception
	     */
	    public ProgrmInfo apiParserSearch() throws Exception {
	        URL url = new URL(getURLParam(null));
	 
	        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	        factory.setNamespaceAware(true);
	        XmlPullParser xpp = factory.newPullParser();
	        BufferedInputStream bis = new BufferedInputStream(url.openStream());
	        xpp.setInput(bis, "utf-8");
	        
	        String tag = null;
	        int event_type = xpp.getEventType();
	        
	        String sidoCd ="";
	        String gugunCd ="";
	        String actBeginTm ="";
	        String actEndTm ="";
	        String actPlace ="";
	        String actWkdy ="";
	        String adultPosblAt ="";
	        String familyPosblAt ="";
	        String grpPosblAt ="";
	        String pbsvntPosblAt ="";
	        String yngbgsPosblAt ="";
	        String appTotal ="";
	        String email ="";	        
	        String fxnum ="";	       
	        String mnnstNm ="";
	        String nanmmbyNm ="";
	        String nanmmbyNmAdmn ="";
	        String noticeBgnde ="";
	        String noticeEndde ="";	       
	        String postAdres ="";
	        String progrmBgnde ="";
	        String progrmCn ="";
	        String progrmEndde ="";
	        String progrmRegistNo ="";
	        String progrmSj ="";
 	        String progrmSttusSe ="";
	        String rcritNmpr ="";
	        String srvcClCode ="";
	        String telno ="";
	        ProgrmInfo progrmInfo=null;

	        while (event_type != XmlPullParser.END_DOCUMENT) {
	            if (event_type == XmlPullParser.START_TAG) {
	                tag = xpp.getName();
	            // System.out.println("tag = "+tag);
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
	                //
	                if(tag.equals("actBeginTm")){
	                	actBeginTm = xpp.getText();	         
	                }
	                if(tag.equals("actEndTm")){
	                	actEndTm = xpp.getText();
	                }	     
	                if(tag.equals("actPlace")){
	                	actPlace = xpp.getText();	         
	                }
	                if(tag.equals("actWkdy")){
	                	actWkdy = xpp.getText();
	                }  
	                if(tag.equals("adultPosblAt")){
	                	adultPosblAt = xpp.getText();	         
	                }
	                if(tag.equals("grpPosblAt")){
	                	grpPosblAt = xpp.getText();
	                }
	                if(tag.equals("pbsvntPosblAt")){
	                	pbsvntPosblAt = xpp.getText();
	                }
	                if(tag.equals("yngbgsPosblAt")){
	                	yngbgsPosblAt = xpp.getText();
	                }
	                //
	                if(tag.equals("appTotal")){
	                	appTotal = xpp.getText();	         
	                }
	                if(tag.equals("email")){
	                	email = xpp.getText();
	                }	     
	                if(tag.equals("fxnum")){
	                	fxnum = xpp.getText();	         
	                }
	                if(tag.equals("mnnstNm")){
	                	mnnstNm = xpp.getText();
	                }  
	                if(tag.equals("nanmmbyNmAdmn")){
	                	nanmmbyNmAdmn = xpp.getText();	         
	                }
	                if(tag.equals("noticeBgnde")){
	                	noticeBgnde = xpp.getText();
	                }
	                if(tag.equals("noticeEndde")){
	                	noticeEndde = xpp.getText();
	                }
	                if(tag.equals("postAdres")){
	                	postAdres = xpp.getText();
	                }
	                //
	                if(tag.equals("progrmCn")){
	                	progrmCn = xpp.getText();	         
	                }
	                if(tag.equals("rcritNmpr")){
	                	rcritNmpr = xpp.getText();
	                }	     
	                if(tag.equals("srvcClCode")){
	                	srvcClCode = xpp.getText();	         
	                }
	                if(tag.equals("telno")){
	                	telno = xpp.getText();
	                }  
	                
	            } else if (event_type == XmlPullParser.END_TAG) {
	                tag = xpp.getName();
	                if (tag.equals("item")) {	              
	              		progrmInfo = new ProgrmInfo(sidoCd, gugunCd, actBeginTm, actEndTm, actPlace, actWkdy, adultPosblAt, familyPosblAt, grpPosblAt, pbsvntPosblAt, yngbgsPosblAt, appTotal, email, fxnum, mnnstNm, nanmmbyNm, nanmmbyNmAdmn, noticeBgnde, noticeEndde, postAdres, progrmBgnde, progrmCn, progrmEndde, progrmRegistNo, progrmSj, progrmSttusSe, rcritNmpr, srvcClCode, telno);
	              		                	
	                }
	            }
	 
	            event_type = xpp.next();
	        }
	  
	        return progrmInfo;
	    }
	   

	    
	    private String getURLParam(String search){
	        String url = PHARM_URL+progrmRegistNo;
	        if(search != null){
	        url = url+"&yadmNm"+search;
	        }
	        return url;
	    }
}
