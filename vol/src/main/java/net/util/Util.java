package net.util;

import java.io.File;
import java.util.ArrayList;

public class Util {

	
	//임시 비밀먼호 생성 함수
	public static String randomPw(){ 
	      char pwCollection[] = new char[] { 
	                        '1','2','3','4','5','6','7','8','9','0', 
	                        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
	                        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
	                        '!','@','#','$','%','^','&','*','(',')'};//배열에 선언 

	      String ranPw = ""; 

	      for (int i = 0; i < 10; i++) { 
	        int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다. 
	        ranPw += pwCollection[selectRandomPw]; 
	      } 
	    return ranPw; 
	  } 
	
	//파일 이동시키기 
	//param: 파일 이름, 전에 있는 폴더 경로, 옮길 폴더 경로
	public void FileMove(String fname,String beforePath,String afterPath) {
	       File dir = new File(afterPath);
	      if (!dir.exists()) { //폴더 없으면 폴더 생성
	            dir.mkdirs();
	        }
	      
	      try{
	          File file =new File(beforePath,fname);
	          file.renameTo(new File(afterPath,fname));  // 옮기 고자 하는 경로로 파일 이동
	     
	      }catch(Exception e){
	          e.printStackTrace();
	      }
	      	
		}
	
	//파일 삭제
	//param: 파일 전체 경로
	public void fileRemove(String filePath) {
		File file=new File(filePath);
   	 if( file.exists() ){
            if(file.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }
	}
	
	
	//아이템1에 있는 내용을 아이템2와 비교해서 중복을 삭제
	//아이템1 리턴
	public ArrayList dupeArrayRemove(ArrayList item1, ArrayList item2) {
		for(int i=0; i< item2.size() ; i++) {
			item1.remove(item2.get(i));
		}
		return item1;
	}
	
	  public synchronized String convertChar(String str) {

		    str = str.replaceAll("<", "&lt;");
		    str = str.replaceAll(">", "&gt;");
		    str = str.replaceAll("'", "&apos;");   
		    str = str.replaceAll("\"", "&quots;"); 
		    str = str.replaceAll("\r\n", "<BR>"); 
		    
		    return str;
	}
}
