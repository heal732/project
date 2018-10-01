package kr.co.vol;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.vol.dao.AiDao;
import kr.co.vol.dao.iDao;
import kr.co.vol.dto.Bbs;
import kr.co.vol.dto.Code;
import kr.co.vol.dto.Comments;
import kr.co.vol.dto.LoginResult;
import kr.co.vol.dto.Member;
import kr.co.vol.dto.Party;
import kr.co.vol.dto.Progrm;
import kr.co.vol.dto.ProgrmInfo;
import kr.co.vol.dto.QnA;
import kr.co.vol.dto.Register;
import net.util.Paging;
import net.util.Util;

@Controller
public class HomeController {

	SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value = "Test.do")
	public String Test() {
		return "Test";
	}

	@RequestMapping(value = "/")
	public String home(HttpSession session,HttpServletRequest requset) {
		if(session.getAttribute("login_id")==null) {
			session.setAttribute("login_id", "guest");
		}
		return "Main/main";
	}

	@RequestMapping(value = "main")
	public String home2() {
		return "redirect:/";
	}

	@RequestMapping(value = "notice.do")
	public String main_notice(Model model, HttpServletRequest request) {
		int nowPage = 1; // 현재 페이지
		int numPerPage = 5; // 페이지당 수
		int recNo = 5;

		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
		} else {
			col = "";
		}
		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
		}
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			if(nowPage==0) {
				nowPage=1;
			}
		}

		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		AiDao aidao = sqlSession.getMapper(AiDao.class);

		// 변수에 넣어야 할 것들
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("type", "N");
		Util util = new Util();
		Bbs b = null;
		List<Bbs> list = aidao.getBbsList(map); // java.util interface
		int total = aidao.getTotalBbs(map);
		for (int i = 0; i < list.size(); i++) {
			String Sj = list.get(i).getTitle();
			Sj = util.convertChar(Sj);
			b = new Bbs(list.get(i).getId(), Sj, list.get(i).getContent(), list.get(i).getType(),
					list.get(i).getWrite_date(), list.get(i).getWriter(), list.get(i).getViews());
			list.set(i, b);
		}
		recNo = total - (nowPage - 1) * numPerPage;
		model.addAttribute("list", list);
		model.addAttribute("recNo", recNo);
		model.addAttribute("type", "N");
		return "Main/iframe_no_recru";
	}

	@RequestMapping(value = "recruit.do")
	public String main_recruit(Model model, HttpServletRequest request) {
		int nowPage = 1; // 현재 페이지
		int numPerPage = 5; // 페이지당 수
		int recNo = 5;

		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
		} else {
			col = "";
		}
		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
		}
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			if(nowPage==0) {
				nowPage=1;
			}
		}

		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		AiDao aidao = sqlSession.getMapper(AiDao.class);

		// 변수에 넣어야 할 것들
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("type", "R");
		Util util = new Util();
		Bbs b = null;
		List<Bbs> list = aidao.getBbsList(map); // java.util interface
		for (int i = 0; i < list.size(); i++) {
			String Sj = list.get(i).getTitle();
			Sj = util.convertChar(Sj);
			b = new Bbs(list.get(i).getId(), Sj, list.get(i).getContent(), list.get(i).getType(),
					list.get(i).getWrite_date(), list.get(i).getWriter(), list.get(i).getViews());
			list.set(i, b);
		}
		int total = aidao.getTotalBbs(map);
		recNo = total - (nowPage - 1) * numPerPage;
		model.addAttribute("list", list);
		model.addAttribute("recNo", recNo);
		model.addAttribute("type", "R");
		return "Main/iframe_no_recru";
	}
	
	@RequestMapping(value = "qna.do")
	public String main_qna(Model model, HttpServletRequest request) {
		int nowPage = 1; // 현재 페이지
		int numPerPage = 5; // 페이지당 수
		int recNo = 5;

		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
		} else {
			col = "title";
		}
		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
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
			if(nowPage==0) {
				nowPage=1;
			}
		}

		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		iDao idao = sqlSession.getMapper(iDao.class);

		// 변수에 넣어야 할 것들
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
		Util util = new Util();
		QnA q = null;
		List<QnA> list = idao.getQnaList(map); // java.util interface
		for (int i = 0; i < list.size(); i++) {
			String Sj = list.get(i).getTitle();
			Sj = util.convertChar(Sj);
			q = new QnA(list.get(i).getId(), Sj, list.get(i).getWriter(), list.get(i).getDate_Q(), list.get(i).getHit(), list.get(i).getContent_Q(), list.get(i).getIsanswer(), list.get(i).getDate_A(), list.get(i).getContent_A());
			list.set(i, q);
		}
		int total = idao.getTotalQna(map);
		recNo = total - (nowPage - 1) * numPerPage;
		model.addAttribute("list", list);
		model.addAttribute("recNo", recNo);
		model.addAttribute("type", "Q");
		return "Main/iframe_qna";
	}
	@RequestMapping(value = "vols.do")
	public String main_vols(Model model, HttpServletRequest request) {
		String url = "./vols_list.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 5; // 페이지당 수
		int recNo = 1;

		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
		}

		String yngbgsPosblAt = null; // 청소년 가능여부
		if (request.getParameter("yngbgsPosblAt") != null) {
			yngbgsPosblAt = request.getParameter("yngbgsPosblAt");
		} else {
			yngbgsPosblAt = "";
		}

		String adultPosblAt = null; // 성인 가능여부
		if (request.getParameter("adultPosblAt") != null) {
			adultPosblAt = request.getParameter("adultPosblAt");
		} else {
			adultPosblAt = "";
		}

		String gugun = null; // 구,군 이름
		if (request.getParameter("gugun") != null) {
			gugun = request.getParameter("gugun");
		} else {
			gugun = "";
		}

		String sido = null; // 시,도 이름
		if (request.getParameter("sido") != null) {
			sido = request.getParameter("sido");
		} else {
			sido = "";
		}
		paser_code paser_code = new paser_code();

		if (!sido.equals("전체") && !sido.equals("") && gugun.equals("전체")) {
			gugun = "";
		}
		Code code = paser_code.getCode(sido, gugun);
		String cod_sido = "";
		String cod_gugun = "";
		if (!sido.equals("전체") && !sido.equals("")) {
			cod_sido = code.getSido();
		}
		if (!gugun.equals("전체") && !gugun.equals("")) {
			cod_gugun = code.getGugun();
		}

		SimpleDateFormat ori_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat change_format = new SimpleDateFormat("yyyyMMdd");
		String new_date_bg = "";
		String progrmBgnde = null; // 봉사 시작날짜
		if (request.getParameter("progrmBgnde") != null && request.getParameter("progrmBgnde") != "") {
			progrmBgnde = request.getParameter("progrmBgnde");
			Date ori_date_bg;
			try {
				ori_date_bg = ori_format.parse(progrmBgnde);
				new_date_bg = change_format.format(ori_date_bg);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			progrmBgnde = "";
		}

		String progrmEndde = null; // 봉사 끝나는 날짜
		String new_date_en = "";
		if (request.getParameter("progrmEndde") != null && request.getParameter("progrmEndde") != "") {
			progrmEndde = request.getParameter("progrmEndde");
			try {
				Date ori_date_en = ori_format.parse(progrmEndde);
				new_date_en = change_format.format(ori_date_en);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			progrmEndde = "";
		}
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			if(nowPage==0) {
				nowPage=1;
			}
		}

		paser pas = new paser();

		ArrayList<Progrm> list = null;
		if (pas.list_numOfRows("5") != null) { // java.util interface
			list = pas.list_numOfRows("5");
		}

		int total = pas.total();
		String paging = Paging.paging2(total, nowPage, numPerPage, word, url, sido, gugun, adultPosblAt, yngbgsPosblAt,
				new_date_bg, new_date_en);

		recNo = total - (nowPage - 1) * numPerPage;
		Progrm p = null;
		Util util = new Util();
		for (int i = 0; i < list.size(); i++) {
			String Sj = list.get(i).getProgrmSj();
			Sj = util.convertChar(Sj);
			p = new Progrm(list.get(i).getGugunCd(), list.get(i).getNanmmbyNm(), list.get(i).getProgrmBgnde(),
					list.get(i).getProgrmEndde(), list.get(i).getProgrmRegistNo(), Sj, list.get(i).getProgrmSttusSe(),
					list.get(i).getSidoCd());
			list.set(i, p);
		}
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("recNo", recNo + 1);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("word", word);
		return "Main/iframe_vols";
	}

	@RequestMapping(value = "Help/join.do")
	public String join() {
		return "Help/join";
	}

	// 회원가입 (join member)
	@RequestMapping(value = "join")
	public String join_ok(HttpServletRequest req) {
		String id = req.getParameter("join_id");
		String pw = req.getParameter("join_pw");
		String name = req.getParameter("join_name");
		String birth = req.getParameter("join_birth");
		String email = req.getParameter("join_email");
		String phone = req.getParameter("join_phone");
		String gender = req.getParameter("gender_val"); // 0: 남자 1:여자
		String joindate = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		iDao idao = sqlSession.getMapper(iDao.class);
		idao.insertMember(id, pw, name, birth, email, phone, gender, joindate);
		return "Main/main";
	}

	@RequestMapping(value = "id_dupe_check")
	@ResponseBody
	public String dupe_check(HttpServletRequest req) {
		String id = req.getParameter("str");
		iDao idao = sqlSession.getMapper(iDao.class);
		int value = idao.id_dupe_check(id); // db조회
		Gson gson = new Gson();
		JsonObject src = new JsonObject();
		src.addProperty("result", value);
		return gson.toJson(src);
	}

	// 로그인 (login)
	@RequestMapping(value = "login")
	public String login_ok(HttpServletRequest req, HttpServletResponse response, Model model) {
		String id_save = req.getParameter("id_save");
		Cookie cookie;
		HttpSession httpSession = req.getSession();
		String login_id = req.getParameter("login_id");
		String login_pw = req.getParameter("login_pw");
		iDao idao = sqlSession.getMapper(iDao.class);
		int result = idao.loginMember(login_id, login_pw);
		String grade = idao.getGrade(login_id);
		httpSession.setAttribute("grade", grade);
		if (result == 1) {
			httpSession.removeAttribute("login_id");
			httpSession.setAttribute("login_id", login_id);
			if (login_id.equals("admin1")) {
				return "redirect:admin_main.do";
			}
			if (id_save == null) {
				cookie = new Cookie("login_id", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("login_id", login_id);
				cookie.setMaxAge(60 * 60 * 24 * 365);
				response.addCookie(cookie);
			}

			if (cookie.getMaxAge() < 30 && cookie.getMaxAge() != 0) {
				cookie.setMaxAge(60 * 60 * 24 * 365);
			}
			model.addAttribute("login_result", "0"); // login success
		} else {
			model.addAttribute("login_result", "1"); // login fail
		}
		return "redirect:/";

	}

	// 로그 아웃 (logout)
	@RequestMapping(value = "logout")
	public String logout_ok(HttpServletRequest req, HttpServletResponse response) {
		HttpSession httpSession = req.getSession();
		httpSession.removeAttribute("login_id");
		httpSession.removeAttribute("grade");
		return "redirect:/";
	}

	@RequestMapping(value = "Help/All_help.do")
	public String help() {
		return "Help/All_help";
	}

	@RequestMapping(value = "Help/search_id.do")
	public String search_id() {
		return "Help/id_help";
	}

	@RequestMapping(value = "Help/search_pw.do")
	public String search_pw() {
		return "Help/pw_help";
	}

	@RequestMapping(value = "Help/search_pw_id_ok.do")
	@ResponseBody
	public String search_pw_id_ok(HttpServletRequest request) {
		// 조회 결과에 따른 리턴
		String id = request.getParameter("id");
		iDao idao = sqlSession.getMapper(iDao.class);
		int result = idao.id_dupe_check(id);
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}

	@RequestMapping(value = "Help/search_pw_email.do")
	public String search_pw_email(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		return "Help/pw_help_email";
	}

	@RequestMapping(value = "Help/search_pw_email_ok.do")
	@ResponseBody
	public String search_pw_email_ok(HttpServletRequest request) {
		// 조회 결과에 따른 리턴
		String email = request.getParameter("email");
		String id = request.getParameter("hide_id");
		iDao idao = sqlSession.getMapper(iDao.class);
		int result = idao.check_email2(email);
		if (result >= 1) {
			Snippet snippet = new Snippet();
			Util u = new Util();
			String tmpPw = u.randomPw();
			idao.update_pw(tmpPw, id);
			snippet.naverMailSend(email, tmpPw, request, id);
		}

		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}

	@RequestMapping(value = "Help/search_pw_go.do")
	public String search_pw_go() {
		return "Help/pw_help_renew";
	}

	@RequestMapping(value = "Help/search_id_num_ok.do")
	@ResponseBody
	public String search_id_num(HttpServletRequest request) {
		String phone = request.getParameter("phone");
		iDao idao = sqlSession.getMapper(iDao.class);
		String[] id = idao.search_phone_id(phone);
		Gson gson = new Gson();
		JsonObject src = new JsonObject();
		int value = 0;
		if (id.length!=0) {
			src.addProperty("id", id.toString());
			value = 1;
		}
		src.addProperty("result", value);
		src.addProperty("ids", gson.toJson(id).toString());
	
		return src.toString();
	}

	@RequestMapping(value = "Help/search_id_email_ok.do")
	@ResponseBody
	public String search_id_email(HttpServletRequest request) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String email = request.getParameter("email");
		String[] id = idao.check_email3(email);
		Gson gson = new Gson();
		JsonObject src = new JsonObject();
		int value = 0;
		if (id.length != 0) {
			src.addProperty("id", id.toString());
			value = 1;
		}
		src.addProperty("result", value);
		src.addProperty("ids", gson.toJson(id).toString());
		return src.toString();
	}

	@RequestMapping(value = "Help/result.do")
	public String search_id_email_result(HttpServletRequest request, Model model) {
	
		return "Help/result";
	}

	@RequestMapping(value = "Bbs/Notice/notice_list.do")
	public String Bbs_list(HttpServletRequest request, Model model) {
		String url = "./notice_list.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 10; // 페이지당 수
		int recNo = 1;

		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
		} else {
			col = "";
		}

		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
		}

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			if(nowPage==0) {
				nowPage=1;
			}
		}

		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		AiDao aidao = sqlSession.getMapper(AiDao.class);

		// 변수에 넣어야 할 것들
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

		return "Bbs/Notice/notice_list";
	}

	@RequestMapping(value = "Bbs/Notice/detail.do")
	public String notice_detail(Model model, HttpServletRequest request) {
		AiDao Aidao = sqlSession.getMapper(AiDao.class);
		String bbs_id = request.getParameter("bbs_id");
		long id = Long.valueOf(bbs_id);
		model.addAttribute("dto", Aidao.bbs_detail(id));
		Aidao.increse_views(id);
		return "Bbs/Notice/notice_detail";
	}

	@RequestMapping(value = "Bbs/QandA/qna_list.do")
	public String Bbs_qna_list(HttpServletRequest request, Model model) {
		String url = "./qna_list.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 10; // 페이지당 수
		int recNo = 1;

		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
		} else {
			col = "title";
		}

		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
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
			if(nowPage==0) {
				nowPage=1;
			}
		}

		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		iDao idao = sqlSession.getMapper(iDao.class);
		
		// 변수에 넣어야 할 것들
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

		return "Bbs/QandA/qna_list";
	}
	
	@RequestMapping(value = "Bbs/QandA/detail.do")
	public String qna_detail(Model model, HttpServletRequest request) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String id = request.getParameter("bbs_id");
		model.addAttribute("dto", idao.qna_detail(id));
		idao.increse_hit(id);
		return "Bbs/QandA/qna_detail";
	}

	@RequestMapping(value = "Bbs/QandA/write.do")
	public String qna_create() {
		return "Bbs/QandA/qna_write";
	}
	
	@RequestMapping(value = "Bbs/QandA/write_ok.do")
	@ResponseBody
	public String qna_write_ok(HttpServletRequest request, HttpSession httpSession) {
		// ------------------- 글쓰기
		JsonObject jsonObject = new JsonObject();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String write_date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		String writer = (String)httpSession.getAttribute("login_id");

		iDao idao = sqlSession.getMapper(iDao.class);
		
		int result = idao.write_qna(title,writer,write_date,content);
		
		jsonObject.addProperty("result", result);
		return jsonObject.toString();

	}
	
	@RequestMapping(value = "/Bbs/Infomation/vol_info.do")
	public String Bbs_info() {
		return "/Bbs/Infomation/vol_info";
	}

	@RequestMapping(value = "Android/getNoticeList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String Bbs_android(HttpServletRequest request, Model model) {
		AiDao aidao = sqlSession.getMapper(AiDao.class);
		String type = "N";
		List<Bbs> list = aidao.getBbsList_And(type); // java.util interface
		
		int total = aidao.getTotalBbs_And();
		Gson gson = new Gson();
		return gson.toJson(list);
	} // 공지 목록

	@RequestMapping(value = "Android/AddNoticeViews.do", produces = "application/json; charset=UTF-8") // return void
	@ResponseBody
	public void Bbs_addhit_android(HttpServletRequest request, Model model) {
		AiDao aidao = sqlSession.getMapper(AiDao.class);
		String id = request.getParameter("Id");
		long bbs_id = Long.valueOf(id);
		aidao.increse_views(bbs_id);
	} // 공지 조회수 증가
	
	@RequestMapping(value = "Android/getQnAList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String Bbs_QnA_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String word="";
		Map map = new HashMap();
		map.put("col", "title");
		map.put("isanswer", "");
		map.put("word", "");
		Integer total = idao.getTotalQna(map);
		map.put("sno", "0");
		map.put("eno", total.toString());
		List<QnA> list = idao.getQnaList(map); // java.util interface
		Gson gson = new Gson();
		return gson.toJson(list);
	} // 질문 목록
	
	@RequestMapping(value = "Android/AddQnA.do", produces = "application/json; charset=UTF-8")   //return void
	@ResponseBody
	public String Bbs_addQ_android(HttpServletRequest request, Model model) {	
		iDao idao=sqlSession.getMapper(iDao.class);	
		String title=request.getParameter("Title");
		String mem_id=request.getParameter("Login_Id");
		String content_Q=request.getParameter("Content_Q");
		String write_date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		idao.insertQnA(title,mem_id,write_date,content_Q);
		Gson gson = new Gson();
		return gson.toJson("");
	} // 질문 등록
	
	@RequestMapping(value = "Android/AddQnAViews.do", produces = "application/json; charset=UTF-8") // return void
	@ResponseBody
	public String Bbs_addViewsQ_android(HttpServletRequest request, Model model) {
		AiDao aidao = sqlSession.getMapper(AiDao.class);
		String id = request.getParameter("Id");
		aidao.AddQnAViews(id);
		Gson gson = new Gson();
		return gson.toJson("");
	} // 질문 조회수 증가

	@RequestMapping(value = "Android/getPartyList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String Bbs_Vols_android(HttpServletRequest request, Model model) {
		AiDao aidao = sqlSession.getMapper(AiDao.class);
		List<Party> list = aidao.getParty_And(); // java.util interface
		int total = aidao.getTotalBbs_And();
		Gson gson = new Gson();
		return gson.toJson(list);
	} // 구인 게시물 목록
	
	@RequestMapping(value = "/Android/getPartyCommentCount.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String bbs_id = request.getParameter("Id");
		String result = idao.totalComment(bbs_id).toString();
		
		Gson gson = new Gson();
		return gson.toJson(result);
	} // 구인 게시물 댓글 수
	
	@RequestMapping(value = "/Android/AddPartyViews.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String AddPartyViews(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String Id = request.getParameter("Id");
		
		idao.AddPartyViews(Id);
		Gson gson = new Gson();
		return gson.toJson("");
	}// 구인 게시물 조회수 증가

	@RequestMapping(value = "Android/AddParty.do", produces = "application/json; charset=UTF-8")  
	@ResponseBody
	public String Bbs_addG_android(HttpServletRequest request, Model model) {	
		iDao idao=sqlSession.getMapper(iDao.class);	
		String title=request.getParameter("Title");
		String mem_id=request.getParameter("Login_Id");
		String content=request.getParameter("Content");
		Util util = new Util();
		String write_date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		idao.insertParty(title,mem_id,write_date,content);
		Gson gson = new Gson();
		return gson.toJson("");
	}// 구인 게시물 등록

	
	@RequestMapping(value = "/Android/AddPartyComment.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String AddPartyComment(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		Integer party_id = Integer.parseInt(request.getParameter("Party_Id"));
		String writer = request.getParameter("Login_Id");
		String content = request.getParameter("Content");
		String write_date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		
		idao.AddPartyComment(party_id, writer, content, write_date);
		Gson gson = new Gson();
		return gson.toJson("");
		
	} // 댓글 추가
	
	@RequestMapping(value = "/Android/getPartyCommentList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getPartyCommentList(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		Integer party_id = Integer.parseInt(request.getParameter("Id"));
		
		ArrayList<Comments> result = idao.getPartyComment(party_id);
		Gson gson = new Gson();
		return gson.toJson(result);
	}//댓글 목록

	@RequestMapping(value = "/Android/AddFavorite.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String fav_save_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String content = request.getParameter("Content");
		String login_id = request.getParameter("Login_Id");
		idao.insertFav(login_id, content);
		Gson gson = new Gson();
		return gson.toJson("");
	}  // 즐겨찾기 추가
	
	@RequestMapping(value = "/Android/getFavoriteList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String fav_get_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String login_id = request.getParameter("Login_Id");
		ArrayList<String> result = idao.getFav(login_id);
		Gson gson = new Gson();
		return gson.toJson(result);
	} // 즐겨찾기 목록

	@RequestMapping(value = "/Android/checkFavorite.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String fav_check_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String login_id = request.getParameter("Login_Id");
		String content = request.getParameter("Content");
		Integer result = idao.checkFav(login_id,content);
		Gson gson = new Gson();
		return gson.toJson(result);
	} // 즐겨찾기 여부
	
	@RequestMapping(value = "/Android/RemoveFavorite.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String fav_remove_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String login_id = request.getParameter("Login_Id");
		String content = request.getParameter("Content");
		idao.removeFav(login_id,content);
		
		String result="d";
		Gson gson =new Gson();
		return gson.toJson(result);
	} // 즐겨찾기 삭제
	
	@RequestMapping(value = "/Android/vols_login.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String login_android(HttpServletRequest request, Model model) {
		System.out.println("login try");
		iDao idao = sqlSession.getMapper(iDao.class);
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		Integer result =idao.loginMember(login_id, login_pw);
		JsonObject jsonObject=new JsonObject();
		Gson gson=new Gson();
		Member member=idao.selMember(login_id);
		LoginResult loginResult =new LoginResult(result.toString(), member);
		return gson.toJson(loginResult).toString();
	} // 로그인
	
	@RequestMapping(value = "Android/vols_id_check.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String check_android_id(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String id = request.getParameter("search_id_confirm");
		int result = idao.id_dupe_check(id);
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}// 비밀번호 찾기 (아이디 여부)
	
	@RequestMapping(value = "/Android/vols_search_id_phone.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String Id_search_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String phone = request.getParameter("search_phone");
		String[] id = idao.search_phone_id(phone);
		JsonObject jsonObject = new JsonObject();
		Gson gson = new Gson();
		jsonObject.addProperty("result", gson.toJson(id).toString());
		return jsonObject.toString();
	}// 전화번호로 아이디 찾기
	
	@RequestMapping(value = "/Android/vols_search_id_email.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String help_id_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String search_email = request.getParameter("search_email");
		String[] result =idao.check_email3(search_email);
		JsonObject jsonObject=new JsonObject();
		Gson gson = new Gson();
		jsonObject.addProperty("result", gson.toJson(result).toString());
		return jsonObject.toString();
	} // 이메일 전송해서 아이디 찾기

	
	@RequestMapping(value = "/Android/vols_email.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String help_id_sendEmail_android(HttpServletRequest request, Model model) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String email = request.getParameter("email");
		Util util=new Util();
		Snippet snippet=new Snippet();
		String tmpPw= util.randomPw();
		String id =request.getParameter("id");
		Integer result = idao.check_email4(email,id);
		snippet.naverMailSend(email, tmpPw, request, id);
		if(id!=null) {
			idao.update_pw(tmpPw, id);
		}else {
			result=0;
		}

		Gson gson= new Gson();
		return gson.toJson(result.toString()).toString();
	} //임시 비밀번호 발급
	
	@RequestMapping(value = "/Android/vols_join.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String join_android(HttpServletRequest request, Model model,@RequestBody Member member) {
		iDao idao = sqlSession.getMapper(iDao.class);
		JsonObject jsonObject=new JsonObject();
		String response_result="";
		Integer result=idao.id_dupe_check(member.getMem_id());
		if(result==1) {
			response_result="0";
		}else {
			String mem_joindate= new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
			idao.insertMember(member.getMem_id(), member.getMem_pw(), member.getMem_name(), member.getMem_birth(), member.getMem_email(), member.getMem_phone(), member.getMem_gender(), mem_joindate);
			response_result="1";
		}
		
		jsonObject.addProperty("result", response_result);
		return jsonObject.toString();
	}// 회원가입
	
	@RequestMapping(value = "Android/vols_ModifyInfo.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String Android_chagne_pw(Model model, HttpServletRequest request, HttpSession session,@RequestBody Member member) {
		iDao idao = sqlSession.getMapper(iDao.class);
		JsonObject jsonObject=new JsonObject();
		String response_result="";
		idao.updateMember(member.getMem_pw(), member.getMem_name(), member.getMem_birth(), member.getMem_email(), member.getMem_phone(),member.getMem_id());
		
		jsonObject.addProperty("result", response_result);
		return jsonObject.toString();
	
	} // 프로필 수정
	
	//봉사 리스트
	@RequestMapping(value = "Vols/vols_list.do")
	public String Vols_list(HttpServletRequest request, Model model) {
		String url = "./vols_list.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 10; // 페이지당 수
		int recNo = 1;

		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
		}

		String yngbgsPosblAt = null; // 청소년 가능여부
		if (request.getParameter("yngbgsPosblAt") != null) {
			yngbgsPosblAt = request.getParameter("yngbgsPosblAt");
		} else {
			yngbgsPosblAt = "";
		}

		String adultPosblAt = null; // 성인 가능여부
		if (request.getParameter("adultPosblAt") != null) {
			adultPosblAt = request.getParameter("adultPosblAt");
		} else {
			adultPosblAt = "";
		}

		String gugun = null; // 구,군 이름
		if (request.getParameter("gugun") != null) {
			gugun = request.getParameter("gugun");
		} else {
			gugun = "";
		}

		String sido = null; // 시,도 이름
		if (request.getParameter("sido") != null) {
			sido = request.getParameter("sido");
		} else {
			sido = "";
		}
		paser_code paser_code = new paser_code();

		if (!sido.equals("전체") && !sido.equals("") && gugun.equals("전체")) {
			gugun = "";
		}
		Code code = paser_code.getCode(sido, gugun);
		String cod_sido = "";
		String cod_gugun = "";
		if (!sido.equals("전체") && !sido.equals("")) {
			cod_sido = code.getSido();
		}
		if (!gugun.equals("전체") && !gugun.equals("")) {
			cod_gugun = code.getGugun();
		}

		SimpleDateFormat ori_format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat change_format = new SimpleDateFormat("yyyyMMdd");
		String new_date_bg = "";
		String progrmBgnde = null; // 봉사 시작날짜
		if (request.getParameter("progrmBgnde") != null && request.getParameter("progrmBgnde") != "") {
			progrmBgnde = request.getParameter("progrmBgnde");
			Date ori_date_bg;
			try {
				ori_date_bg = ori_format.parse(progrmBgnde);
				new_date_bg = change_format.format(ori_date_bg);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			progrmBgnde = "";
		}

		String progrmEndde = null; // 봉사 끝나는 날짜
		String new_date_en = "";
		if (request.getParameter("progrmEndde") != null && request.getParameter("progrmEndde") != "") {
			progrmEndde = request.getParameter("progrmEndde");
			try {
				Date ori_date_en = ori_format.parse(progrmEndde);
				new_date_en = change_format.format(ori_date_en);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			progrmEndde = "";
		}
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			if(nowPage==0) {
				nowPage=1;
			}
		}

		paser pas = new paser();

		// schCateGu=all progrmSj 제목 ,progrmCn 내용, all 모두
		// keyword= 검색어
		// progrmBgnde=20180724&progrmEndde=20180830 시작 날짜 끝날짜
		// schSido=6280000&schSign1=3820000 시도 군
		// adultPosblAt=Y&yngbgsPosblAt=Y&familyPosblAt=N&pbsvntPosblAt=N 가능여부

		ArrayList<Progrm> list = null;
		if (pas.list(nowPage, cod_sido, cod_gugun, adultPosblAt, yngbgsPosblAt, word, new_date_bg,
				new_date_en) != null) { // java.util interface
			list = pas.list(nowPage, cod_sido, cod_gugun, adultPosblAt, yngbgsPosblAt, word, new_date_bg, new_date_en);
		}

		int total = pas.total();
		String paging = Paging.paging2(total, nowPage, numPerPage, word, url, sido, gugun, adultPosblAt, yngbgsPosblAt,
				new_date_bg, new_date_en);

		recNo = total - (nowPage - 1) * numPerPage;

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("recNo", recNo + 1);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("word", word);

		return "Vols/vols_list";
	}

	@RequestMapping(value = "Vols/gugun_list")
	@ResponseBody
	public Object gugun_List(HttpServletRequest request, Model model) {
		paser_code code = new paser_code();

		String sido = request.getParameter("sido");
		Integer total = 0;
		ArrayList<String> list = new ArrayList<String>();

		for (int i = 0; i < total / 10 + 1; i++) {
			list.addAll(code.getlist(i, sido));
			total = code.total();
		}

		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("list", list);
		retVal.put("total", total);

		return retVal;
	}

	@RequestMapping(value = "Vols/detail.do")
	public String vols_detail(Model model, HttpServletRequest request) {
		String bbs_id = request.getParameter("progrmRegistNo");
		paser2 pas2 =new paser2();
		ProgrmInfo progrmInfo=pas2.Info(bbs_id);
		model.addAttribute("dto", progrmInfo);
		return "Vols/vols_detail";
	}
	
	@RequestMapping(value = "Vols/recruit_detail.do")
	public String vols_recruit_detail(Model model, HttpServletRequest request) {
		AiDao Aidao = sqlSession.getMapper(AiDao.class);
		String bbs_id = request.getParameter("bbs_id");
		int id = Integer.valueOf(bbs_id);
		model.addAttribute("dto", Aidao.bbs_detail(id));
		model.addAttribute("bbs_id",bbs_id);
		Aidao.increse_views(id);
		int nowPage = 1; 
		int numPerPage = 5;
		int recNo = 1;
		String url = "recruit_detail.do";
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		String col = null;
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
		} else {
			col = "";
		}

		String word = null;
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
		}
		int total = Aidao.getCommentCount(id);
		
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}else {
			nowPage=(int)(Math.ceil((double)total/numPerPage));
			if(nowPage==0) {
				nowPage=1;
			}
			System.out.println("nowpage : " + nowPage);
		}
		
		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		AiDao aidao = sqlSession.getMapper(AiDao.class);
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<Comments> list = aidao.getCommentList(map);
		paser pas = new paser();
		
		String paging = Paging.paging4(total, nowPage, numPerPage,url,bbs_id);
		recNo = total - (nowPage - 1) * numPerPage;
		model.addAttribute("list",list);
		model.addAttribute("paging", paging);
		model.addAttribute("recNo", recNo + 1);
		model.addAttribute("nowPage", nowPage);
		/*model.addAttribute("col", col);*/
		
		return "Vols/vols_recruit_detail";
	}

	@RequestMapping(value = "Vols/addComment_ok.do")
	public String addComment_ok(Model model, HttpServletRequest request,HttpSession session) {
		AiDao Aidao = sqlSession.getMapper(AiDao.class);
		session=request.getSession();
		String party_id = request.getParameter("party_id");
		System.out.println(party_id);
		String content = request.getParameter("comment_inputtext");
		Integer id = Integer.valueOf(party_id);
		String write_date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		String login_id=(String)session.getAttribute("login_id");
		Aidao.addComment(id,login_id , content, write_date);
		return "redirect:./recruit_detail.do"+"?bbs_id="+id.toString();
	}
	
	@RequestMapping(value = "Vols/deleteComment_ok.do")
	public String deleteComment_ok(Model model, HttpServletRequest request) {
		AiDao Aidao = sqlSession.getMapper(AiDao.class);
		
		
		String String_id = request.getParameter("id");
		Integer id = Integer.valueOf(String_id);
		Aidao.deleteComment(id);
		
		String party_id = request.getParameter("party_id");
		return "redirect:./recruit_detail.do"+"?bbs_id="+party_id;
	}

	@RequestMapping(value = "Vols/del.do")
	@ResponseBody
	public String vols_recruit_del(Model model, HttpServletRequest request) {
		String bbs_id = request.getParameter("bbs_id");
		AiDao Aidao = sqlSession.getMapper(AiDao.class);
		long id=Long.valueOf(bbs_id);
		Aidao.delete_bbs(id);
		Integer result=1;
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	@RequestMapping(value = "Vols/update.do")
	public String vols_recruit_update(Model model, HttpServletRequest request) {
		AiDao Aidao = sqlSession.getMapper(AiDao.class);
		String bbs_id = request.getParameter("bbs_id");
		int id = Integer.valueOf(bbs_id);
		model.addAttribute("dto", Aidao.bbs_detail(id));
		Aidao.increse_views(id);
		return "Vols/vols_recruit_update";
	}
	@RequestMapping(value = "Vols/update_ok.do")
	@ResponseBody
	public String vols_recruit_update_ok(Model model,HttpServletRequest request) {
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
	@RequestMapping(value = "Vols/vols_recruit_list.do")
	public String vols_recruit_list(Model model, HttpServletRequest request) {

		String url = "./vols_recruit_list.do";
		int nowPage = 1; // 현재 페이지
		int numPerPage = 10; // 페이지당 수
		int recNo = 1;

		String col = null; // 검색 컬럼
		if (request.getParameter("col") != null) {
			col = request.getParameter("col");
		} else {
			col = "";
		}

		String word = null; // 검색어
		if (request.getParameter("word") != null) {
			word = request.getParameter("word");
		} else {
			word = "";
		}

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			if(nowPage==0) {
				nowPage=1;
			}
		}

		int sno = ((nowPage - 1) * numPerPage); // (0*10)+1 = 1, 11, 21
		int eno = nowPage * numPerPage;
		AiDao aidao = sqlSession.getMapper(AiDao.class);

		// 변수에 넣어야 할 것들
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("type", "R");

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
		return "Vols/vols_recruit_list";
	}

	@RequestMapping(value = "Vols/recruit_write.do")
	public String recruit_create() {
		return "Vols/vols_write";
	}

	@RequestMapping(value = "Vols/create_ok.do")
	@ResponseBody
	public String recruit_create_ok(HttpServletRequest request, HttpSession httpSession) {
		// ------------------- 글쓰기
		JsonObject jsonObject = new JsonObject();
		Util util = new Util();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String type = "R"; // 봉사 구인
		String write_date = new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
		String writer = (String) httpSession.getAttribute("login_id");

		String splitTag = request.getContextPath() + "/resources/tempFile/";
		String splitTag2 = "\" title=\"";
		String[] tmpNames = content.split(splitTag);
		String[] tmpNames2;
		String afterfolderName = "resources/upload";
		String beforfolderName = "resources/tempFile";
		String root_path = request.getSession().getServletContext().getRealPath("/"); // 서버 경로
		String afterpath = root_path + "/" + afterfolderName; // 새로 저장할 경로
		String beforeFilePath = root_path + "/" + beforfolderName;

		ArrayList<String> NamesArray = new ArrayList<String>(); // 파일명 목록
		for (int i = 1; i < tmpNames.length; i++) {
			tmpNames2 = tmpNames[i].split(splitTag2);
			NamesArray.add(tmpNames2[0]);
		}
		for (int i = 0; i < NamesArray.size(); i++) {
			util.FileMove(NamesArray.get(i), beforeFilePath, afterpath);
		}
		String real_content = ""; // 파일 위치 옮기고 난 후 내용
		String path = request.getContextPath();
		String folder = "/resources/upload/";
		String filePath = path + folder;
		for (int i = 0; i < tmpNames.length; i++) {
			real_content += tmpNames[i];
			if (i == tmpNames.length - 1) {
				break;
			}
			real_content += filePath;
		}
		AiDao Aidao = sqlSession.getMapper(AiDao.class);
		Bbs bbs = new Bbs(0l, title, real_content, type, write_date, writer, 0);
		int result = Aidao.write_notice(bbs);
		for (int i = 0; i < NamesArray.size(); i++) {
			Aidao.write_notice_img(NamesArray.get(i), bbs.getId());
		}
		jsonObject.addProperty("result", result);
		return jsonObject.toString();

	}

	@RequestMapping(value = "Mypage/main.do")
	public String mypage_main(Model model, HttpSession session) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String id = (String) session.getAttribute("login_id");
		Member mem = idao.selMember(id);
		model.addAttribute("member", mem);
		return "Mypage/main";
	}

	@RequestMapping(value = "Mypage/modi_profile.do")
	public String mypage_modi_profile(Model model, HttpSession session) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String id = (String) session.getAttribute("login_id");
		Member mem = idao.selMember(id);
		model.addAttribute("member", mem);
		return "Mypage/modi_profile";
	}

	@RequestMapping(value = "Mypage/modi_profile_ok.do")
	@ResponseBody
	public String mypage_modi_profile_ok(Model model, HttpSession session, HttpServletRequest request) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String id = (String) session.getAttribute("login_id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		int result = idao.update_profile(id, name, email, phone);
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}

	@RequestMapping(value = "Mypage/modi_chk_pw.do")
	public String mypage_modi_pw_chk(Model model, HttpServletRequest request) {
		return "Mypage/check_pw";
	}

	@RequestMapping(value = "Mypage/modi_chk_pw_ok.do")
	@ResponseBody
	public String mypage_modi_pw_chk_ok(Model model, HttpServletRequest request, HttpSession session) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String pw = request.getParameter("pw");
		String id = (String) session.getAttribute("login_id");
		int result = idao.check_pw(pw, id);
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		return json.toString();
	}

	@RequestMapping(value = "Mypage/modi_pw.do")
	public String mypage_modi_pw(Model model, HttpServletRequest request) {
		return "Mypage/modi_pw";
	}

	@RequestMapping(value = "Mypage/grade_regi.do")
	public String mypage_grade_regi(Model model, HttpServletRequest request) {
		return "Mypage/grade_regi";
	}

	@RequestMapping(value = "Mypage/modi_pw_ok.do")
	@ResponseBody
	public String mypage_modi_pw_ok(Model model, HttpServletRequest request, HttpSession session) {
		iDao idao = sqlSession.getMapper(iDao.class);
		String new_pw = request.getParameter("new_pw");
		String pre_pw = request.getParameter("pre_pw");
		String id = (String) session.getAttribute("login_id");
		int result = 0;
		if (idao.check_pw(pre_pw, id) == 1) {
			result = idao.update_pw(new_pw, id);
		} else {
			result = 2;
		}

		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("result", result);

		return jsonObject.toString();
	}

	@RequestMapping(value = "Mypage/register_go")
	@ResponseBody
	public String register(Model model, HttpServletRequest request) {
		iDao idao = sqlSession.getMapper(iDao.class);
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String phone = request.getParameter("num");
		String addr = request.getParameter("addr");
		String reason = request.getParameter("reason");
		String mem_id = (String) session.getAttribute("login_id");
		Integer result = 0;
		JsonObject jsonObject = new JsonObject();
		if (idao.dup_Register(mem_id) == 1) {
			result = 2;
			jsonObject.addProperty("result", result);
			return jsonObject.toString();
		}
		Register register = new Register(name, phone, addr, reason, mem_id);
		Map<String, Register> map = new HashMap<String, Register>();
		map.put("register", register);
		result = idao.insertRegister(map);
		jsonObject.addProperty("result", result);
		return jsonObject.toString();
	}

	@RequestMapping(value = "Mypage/result")
	public String result(Model model, HttpServletRequest request) {
		String msg = "신청되셨습니다. 신청은 2~3일 기간으로 받고 있습니다. ";
		request.setAttribute("msg", msg);
		return "Mypage/result";
	}

	// 파일 임시 폴더 저장 / 출력
	@RequestMapping(value = "/file_uploader_html5.do")
	@ResponseBody
	public String multiplePhotoUpload(HttpServletRequest request) {
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String url = request.getRequestURL().toString().replace(request.getRequestURI(), "") + request.getContextPath();
		String attach_path = "resources/tempFile/";
		String filePath = root_path + attach_path;
		// 파일정보
		StringBuffer sb = new StringBuffer();
		File dir = new File(filePath);

		if (!dir.exists()) { // 폴더 없으면 폴더 생성
			dir.mkdirs();
		}
		try {
			// 파일명을 받는다 - 일반 원본파일명
			String oldName = request.getHeader("file-name");
			// 파일 기본경로 _ 상세경로
			String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis()))
					.append(UUID.randomUUID().toString()).append(oldName.substring(oldName.lastIndexOf(".")))
					.toString();
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + saveName);

			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true").append("&sFileName=").append(oldName).append("&sFileURL=")
					.append(url + "/" + attach_path).append(saveName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
