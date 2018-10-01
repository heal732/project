package kr.co.vol.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.vol.dto.Comments;
import kr.co.vol.dto.Member;
import kr.co.vol.dto.QnA;

public interface iDao {
	
	/* 회원가입 */
	public void insertMember(String mem_id,String mem_pw,String mem_name,String mem_birth,String mem_email,String mem_phone,String mem_gender,String mem_joindate);
	
	/* 로그인 */
	public Integer loginMember(String login_id,String login_pw);
	
	public String getGrade(String id);
	public Integer id_dupe_check(String id);
	public Integer check_pw(String pw,String id);
	public Integer update_pw(String pw,String id);
	public Integer update_profile(String id, String name, String email, String phone);
	public String check_email(String email); //이메일로 아이디 찾기
	public Integer check_email2(String email); //이메일이 있는지 확인
	public String[] check_email3(String email); //이메일로 아이디 찾기
	public Integer check_email4(String email,String id); //이메일과 아이디가 일치하는지 확인
	public String[] search_phone_id(String phone);
	public Member selMember(String id);
	
	public Integer insertRegister(Map map);
	public Integer dup_Register(String mem_id);
	
	public List<QnA> getQnaList(Map map);
	public Integer getTotalQna(Map map);
	public QnA qna_detail(String id);
	public Integer update_qna_anwer(String id,String date,String content);
	public void increse_hit(String id);
	public Integer write_qna(String title,String id,String write_date,String content);
	public Integer write_qna_anwer(String id,String date,String content);
	public void insertQnA(String title,String mem_id,String write_date,String content_Q);
	public void updateMember(String pw, String name, String birth,String email, String phone,String id);
	
	
	
	
	public void insertFav(String id, String content);
	public void removeFav(String id,String content);
	public ArrayList<String> getFav(String id);
	public Integer checkFav(String id,String content);
	
	public void insertParty(String title,String id,String write_date, String content);
	public Integer totalComment(String id);
	public void AddPartyViews(String id);
	public void AddPartyComment(Integer party_id, String writer, String content, String write_date );
	public ArrayList<Comments> getPartyComment(Integer party_id);
}
