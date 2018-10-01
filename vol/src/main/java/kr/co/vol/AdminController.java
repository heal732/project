package kr.co.vol;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.vol.dao.AiDao;
import kr.co.vol.dao.iDao;
import kr.co.vol.dto.Bbs;
import kr.co.vol.dto.ImgPath;
import kr.co.vol.dto.Member;
import kr.co.vol.dto.QnA;
import kr.co.vol.dto.Register;
import net.util.Paging;
import net.util.Util;


@Controller
public class AdminController {

	SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@RequestMapping(value = "error.do")
	public String error() {
		return "Admin/error";
	}
	
	
	@RequestMapping(value = "admin_main.do")
	public String home(Model model) {

		return "Admin/main";
	}
	
	@RequestMapping(value = "member_manage/member_manage.do")
	public String manage_mem(HttpServletRequest request, Model model) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		
		String url = "./member_manage.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 10; // 페이지당  수
		int recNo = 1;
		
		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) { 
			col = request.getParameter("col");
		}else {
			col="";
		}
		
		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		}else {
			word="";
		}
		
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		AiDao aidao=sqlSession.getMapper(AiDao.class);
		
		//변수에 넣어야 할 것들
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
	
		List<Member> list = aidao.getMemberList(map); 
		int total = aidao.getTotalMember(map);
		
		String paging = Paging.paging3(total, nowPage, numPerPage, col, word, url);

		recNo = total - (nowPage - 1) * numPerPage;
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("recNo", recNo + 1);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("pre_page", "M");
		return "Admin/member_manage/member_manage";
	}
	
	
	@RequestMapping(value = "member_manage/read.do")
	public String manage_member_read(Model model,String m_id) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		model.addAttribute("dto", Aidao.member_detail(m_id));
		return "Admin/member_manage/member_detail";
	}
	
	@RequestMapping(value = "member_manage/register_detail.do")
	public String manage_member_regist_detail(Model model,String id) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		model.addAttribute("dto", Aidao.regist_detail(id));
		return "Admin/member_manage/member_register_detail";
	}
	@RequestMapping(value = "member_manage/member_regist.do")
	public String manage_member_regist_list(Model model,HttpServletRequest request) {
			AiDao Aidao=sqlSession.getMapper(AiDao.class);
			
			String url = "./member_manage.do";
			int nowPage = 1; // 현재 페이지
			int numPerPage = 10; // 페이지당  수
			int recNo = 1;
			
			if (request.getParameter("nowPage") != null) {
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			
			int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
			int eno = nowPage * numPerPage;
			AiDao aidao=sqlSession.getMapper(AiDao.class);
			
			//변수에 넣어야 할 것들
			Map map = new HashMap();
			map.put("sno", sno);
			map.put("eno", eno);
		
			List<Register> list = aidao.getRegisterList(map); 
			int total = aidao.getTotalRegister(map);
			
			String paging = Paging.paging1(total, nowPage, numPerPage, url);

			recNo = total - (nowPage - 1) * numPerPage;
			
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("recNo", recNo + 1);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("pre_page", "G");
		return "Admin/member_manage/member_register_list";
	}
	@RequestMapping(value = "member_manage/grade_chagne")
	@ResponseBody
	public String manage_member_regist_gragde_change(Model model,HttpServletRequest request) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		String id= request.getParameter("id");
		Integer result=Aidao.grade_change(id,"B");
		Aidao.del_regist(id);
		JsonObject jsonObject=new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "member_manage/delete_regist")
	@ResponseBody
	public String manage_member_regist_delete(Model model,HttpServletRequest request) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		String id= request.getParameter("id");
		Integer result=Aidao.del_regist(id);
		JsonObject jsonObject=new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "notice_manage/notice_list.do")
	public String manage_notice(HttpServletRequest request, Model model) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		
		String url = "./notice_list.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 10; // 페이지당  수
		int recNo = 1;
		
		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) { 
			col = request.getParameter("col");
		}else {
			col="";
		}
		
		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		}else {
			word="";
		}
		
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		AiDao aidao=sqlSession.getMapper(AiDao.class);
		
		//변수에 넣어야 할 것들
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("type", "N");
		List<Bbs> list = aidao.getBbsList(map); // java.util interface
		int total = aidao.getTotalBbs(map);
		
		String paging = Paging.paging3(total, nowPage, numPerPage, col, word, url);

		recNo = total - (nowPage - 1) * numPerPage;
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("recNo", recNo + 1);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("pre_page", "N");
		return "Admin/notice_manage/notice_list";
	}
	
	@RequestMapping(value = "notice_manage/detail.do")
	public String manage_notice_read(Model model,HttpServletRequest request) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		String bbs_id=request.getParameter("bbs_id");
		long id=Long.valueOf(bbs_id);
		model.addAttribute("dto", Aidao.bbs_detail(id));
		Aidao.increse_views(id);
		return "Admin/notice_manage/notice_detail";
	}
	
	@RequestMapping(value = "notice_manage/create.do")
	public String notice_create() {
		return "Admin/notice_manage/notice_write";
	}
	
	@RequestMapping(value = "notice_manage/create_ok.do")
	@ResponseBody
	public String notice_create_ok(HttpServletRequest request,HttpSession httpSession) {
		// ------------------- 글쓰기 
		 JsonObject jsonObject =new JsonObject();
		Util util =new  Util();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String type="N";
		String write_date=new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		String writer=(String)httpSession.getAttribute("login_id");
		
		String splitTag=request.getContextPath()+"/resources/tempFile/";
        String splitTag2="\" title=\"";
        String[] tmpNames=content.split(splitTag);
        String[] tmpNames2;
        String afterfolderName="resources/upload";
        String beforfolderName="resources/tempFile";
        String root_path = request.getSession().getServletContext().getRealPath("/");  //서버 경로
        String afterpath = root_path+"/"+afterfolderName;  //새로 저장할 경로
        String beforeFilePath=root_path+"/"+beforfolderName;
        
        ArrayList<String> NamesArray=new ArrayList<String>(); //파일명 목록
        for(int i=1 ; i<tmpNames.length ; i++){
        	tmpNames2=tmpNames[i].split(splitTag2);
        	  NamesArray.add(tmpNames2[0]);
        }
        for(int i=0 ; i<NamesArray.size() ; i++) {
        	util.FileMove (NamesArray.get(i),beforeFilePath,afterpath);
      	}
        String real_content=""; //파일 위치 옮기고 난 후 내용
        String path=request.getContextPath();
        String folder="/resources/upload/";
        String filePath=path+folder;
        for(int i=0; i<tmpNames.length ; i++) {
        	real_content+=tmpNames[i];
        	if(i==tmpNames.length-1) {
        		break;
        	}
        	real_content+=filePath;
        }
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		Bbs bbs= new Bbs(0l, title, real_content, type, write_date, writer, 0);
		int result=Aidao.write_notice(bbs);
		for(int i=0 ; i<NamesArray.size() ; i++) {
			Aidao.write_notice_img(NamesArray.get(i),bbs.getId());
		}
		jsonObject.addProperty("result", result);
		return jsonObject.toString();

	}
	
	@RequestMapping(value = "notice_manage/update.do")
	public String notice_update(Model model,long bbs_id) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		model.addAttribute("dto", Aidao.bbs_detail(bbs_id));
		return "Admin/notice_manage/notice_update";
	}

	@RequestMapping(value = "notice_manage/update_ok.do")
	@ResponseBody
	public String notice_update_ok(Model model,HttpServletRequest request) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		Util util =new Util();
		JsonObject jsonObject= new JsonObject();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String write_date=new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		String bbs_id=request.getParameter("id");
		long id=Long.valueOf(bbs_id);
		
		String splitTag=request.getContextPath()+"/resources/tempFile/";
		String splitTag_=request.getContextPath()+"/resources/upload/";
        String splitTag2="\" title=\"";
        String[] tmpNames=content.split(splitTag);
        String[] tmpNames_=content.split(splitTag_);
        String[] tmpNames2;
        String afterfolderName="resources/upload";
        String beforfolderName="resources/tempFile";
        String root_path = request.getSession().getServletContext().getRealPath("/");  //서버 경로
        String afterpath = root_path+"/"+afterfolderName;  //새로 저장할 경로
        String beforeFilePath=root_path+"/"+beforfolderName;
        String real_content=""; //파일 위치 옮기고 난 후 내용
        String path=request.getContextPath();
        String folder="/resources/upload/";
        String filePath="";
        
        //컨텐츠에서 받아온 이미지 목록
        ArrayList<String> NamesArray=new ArrayList<String>(); //파일명 목록
        for(int i=1 ; i<tmpNames.length ; i++){
        	tmpNames2=tmpNames[i].split(splitTag2);
        	  NamesArray.add(tmpNames2[0]);
        }
        tmpNames2=new String[] {};
        for(int i=1 ; i<tmpNames_.length ; i++){
        	tmpNames2=tmpNames_[i].split(splitTag2);
        	  NamesArray.add(tmpNames2[0]);
        }
        
        //현재 컨텐츠에 있는 사진을 제외하고 삭제 해야됨
		ArrayList<String> item=(ArrayList<String>) Aidao.getImgList(id); //기존에 있는 이미지파일
	
		//파일 비교
		item=util.dupeArrayRemove(item, NamesArray);
		
		//파일 삭제 부분
        for(int i=0 ; i < item.size() ; i++) {
        	filePath = afterpath+"/"+item.get(i);
        	 util.fileRemove(filePath);
        }
        
		//파일 이동 부분
        for(int i=0 ; i<NamesArray.size() ; i++) {
        	util.FileMove (NamesArray.get(i),beforeFilePath,afterpath);
      	}
        filePath=path+folder;
        for(int i=0; i<tmpNames.length ; i++) {
        	real_content+=tmpNames[i];
        	if(i==tmpNames.length-1) {
        		break;
        	}
        	real_content+=filePath;
        }
	
		int result=Aidao.update_bbs(id,title,real_content,write_date);
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}
	
	@RequestMapping(value = "notice_manage/delete.do")
	@ResponseBody
	public String notice_delete(long bbs_id,HttpServletRequest request) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		Integer result = Aidao.delete_bbs(bbs_id);
		ArrayList<String> item=(ArrayList<String>) Aidao.getImgList(bbs_id);
		if(item!=null) {
			 	String afterfolderName="resources/upload";
		        String root_path = request.getSession().getServletContext().getRealPath("/");  //서버 경로
		        String afterpath = root_path+"/"+afterfolderName;  //폴더 경로
		        for(int i=0 ; i < item.size() ; i++) {
		        	 String filePath = afterpath+"/"+item.get(i);
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
		}
		Aidao.delete_img(bbs_id);
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
	@RequestMapping(value = "qna_manage/qna_list.do")
	public String manage_qna(HttpServletRequest request, Model model) {
		AiDao Aidao=sqlSession.getMapper(AiDao.class);
		
		String url = "./qna_list.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 10; // 페이지당  수
		int recNo = 1;
		
		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) { 
			col = request.getParameter("col");
		}else {
			col="title";
		}
		
		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		}else {
			word="";
		}
		
		String isanswer_ing = null; // 답변 진행중
		if (request.getParameter("isanswer_ing") != null) {
			isanswer_ing = request.getParameter("isanswer_ing");
		}else {
			isanswer_ing="";
		}
		
		String isanswer_com = null; // 답변 진행중
		if (request.getParameter("isanswer_com") != null) {
			isanswer_com = request.getParameter("isanswer_com");
		}else {
			isanswer_com="";
		}
		
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		iDao idao=sqlSession.getMapper(iDao.class);
		
		//변수에 넣어야 할 것들
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		if(!isanswer_ing.equals("") || !isanswer_com.equals("")) {
			if(!isanswer_ing.equals("")) {
				map.put("isanswer", 1);
			}else {
				map.put("isanswer", 2);
			}
		}else {
			map.put("isanswer", "");
		}
		 
		List<QnA> list = idao.getQnaList(map); // java.util interface
		int total = idao.getTotalQna(map);
		
		String paging = Paging.paging3(total, nowPage, numPerPage, col, word, url);

		recNo = total - (nowPage - 1) * numPerPage;
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("recNo", recNo + 1);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("pre_page", "Q");
		model.addAttribute("isanswer_ing", isanswer_ing);
		model.addAttribute("isanswer_com", isanswer_com);
		
		return "Admin/qna_manage/qna_list";
	}
	
	@RequestMapping(value = "qna_manage/detail.do")
	public String manage_qna_read(Model model,HttpServletRequest request) {
		iDao idao=sqlSession.getMapper(iDao.class);
		String bbs_id=request.getParameter("bbs_id");
		model.addAttribute("dto", idao.qna_detail(bbs_id));
		idao.increse_hit(bbs_id);
		return "Admin/qna_manage/qna_detail";
	}
	
	@RequestMapping(value = "qna_manage/write.do")
	public String qna_create(HttpServletRequest request,Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String id= request.getParameter("id");
		if(id!=null) {
			QnA qna=idao.qna_detail(id);
			model.addAttribute("qna_content", qna.getContent_A());
		}
		return "Admin/qna_manage/qna_write";
	}
	
	@RequestMapping(value = "qna_manage/write_ok.do")
	@ResponseBody
	public String qna_create_ok(HttpServletRequest request,HttpSession httpSession) {
		// ------------------- 글쓰기 
		 JsonObject jsonObject =new JsonObject();
		Util util =new  Util();
		String content=request.getParameter("content");
		String id=request.getParameter("bbs_id");
		String kind=request.getParameter("kind");
		String write_date=new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		
		iDao idao=sqlSession.getMapper(iDao.class);
		Integer result=0;
		if(kind.equals("1")) {
			result=idao.write_qna_anwer(id,write_date, content);
		}else {
			result=idao.update_qna_anwer(id, write_date, content);
		}
	
		jsonObject.addProperty("result", result);
		return jsonObject.toString();

	}
}