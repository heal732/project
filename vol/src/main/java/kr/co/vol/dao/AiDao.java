package kr.co.vol.dao;


import java.util.List;
import java.util.Map;

import kr.co.vol.dto.Bbs;
import kr.co.vol.dto.Comments;
import kr.co.vol.dto.ImgPath;
import kr.co.vol.dto.Member;
import kr.co.vol.dto.Party;
import kr.co.vol.dto.QnA;
import kr.co.vol.dto.Register;

public interface AiDao {
	public List<Member> getMemberList(Map<String,String> map);
	public int getTotalMember(Map<String,String> map);
	public Member member_detail(String m_id);
	
	public int write_notice(Bbs bbs);
	public void write_notice_img(String URL,long id);
	
	/* 공지 목록, 공지 갯수 */
	public List<Bbs> getBbsList(Map<String,String> map);
	public int getTotalBbs(Map<String,String> map);
	
	
	public Bbs bbs_detail(long bbs_id);
	public void increse_views(long bbs_id);
	public int update_bbs(long bbs_id,String title,String content,String write_date);
	public int delete_bbs(long bbs_id);
	public void delete_img(long bbs_id);
	
	public List<Bbs> getBbsList_And(String type);
	public List<Party> getParty_And();
	public int getTotalBbs_And();
	public List<String> getImgList(long bbs_id);
 	
	public List<Register> getRegisterList(Map<String,String> map);
	public Integer getTotalRegister(Map<String,String> map);
	public Register regist_detail(String id);
	public Integer grade_change(String id , String grade);
	public Integer del_regist(String id);
	
	public void AddQnAViews(String id);
	public List<Comments> getCommentList(Map<String,String> map);
	public void addComment(long bbs_id, String writer, String content, String write_date);
	public void deleteComment(long id);
	public int getCommentCount(long id);
}
