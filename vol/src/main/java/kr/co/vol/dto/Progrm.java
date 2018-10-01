package kr.co.vol.dto;

public class Progrm {

	private String gugunCd;			//구군
	private String nanmmbyNm;		//위치
	private String progrmBgnde;		//시작날짜
	private String progrmEndde;		//끝나는 날짜
	private String progrmRegistNo;	//봉사 id
	private String progrmSj;		//봉사제목
	private String progrmSttusSe;	//봉사 상태
	private String sidoCd;    		//시도
	public Progrm() {
		super();
	}
	public Progrm(String gugunCd, String nanmmbyNm, String progrmBgnde, String progrmEndde, String progrmRegistNo,
			String progrmSj, String progrmSttusSe, String sidoCd) {
		super();
		this.gugunCd = gugunCd;
		this.nanmmbyNm = nanmmbyNm;
		this.progrmBgnde = progrmBgnde;
		this.progrmEndde = progrmEndde;
		this.progrmRegistNo = progrmRegistNo;
		this.progrmSj = progrmSj;
		this.progrmSttusSe = progrmSttusSe;
		this.sidoCd = sidoCd;
	}
	public String getGugunCd() {
		return gugunCd;
	}
	public void setGugunCd(String gugunCd) {
		this.gugunCd = gugunCd;
	}
	public String getNanmmbyNm() {
		return nanmmbyNm;
	}
	public void setNanmmbyNm(String nanmmbyNm) {
		this.nanmmbyNm = nanmmbyNm;
	}
	public String getProgrmBgnde() {
		return progrmBgnde;
	}
	public void setProgrmBgnde(String progrmBgnde) {
		this.progrmBgnde = progrmBgnde;
	}
	public String getProgrmEndde() {
		return progrmEndde;
	}
	public void setProgrmEndde(String progrmEndde) {
		this.progrmEndde = progrmEndde;
	}
	public String getProgrmRegistNo() {
		return progrmRegistNo;
	}
	public void setProgrmRegistNo(String progrmRegistNo) {
		this.progrmRegistNo = progrmRegistNo;
	}
	public String getProgrmSj() {
		return progrmSj;
	}
	public void setProgrmSj(String progrmSj) {
		this.progrmSj = progrmSj;
	}
	public String getProgrmSttusSe() {
		return progrmSttusSe;
	}
	public void setProgrmSttusSe(String progrmSttusSe) {
		this.progrmSttusSe = progrmSttusSe;
	}
	public String getSidoCd() {
		return sidoCd;
	}
	public void setSidoCd(String sidoCd) {
		this.sidoCd = sidoCd;
	}
	
	
	

}
