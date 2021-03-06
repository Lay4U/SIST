package travel.plan;

import travel.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PlanInfoDAO {
    private Connection conn;
    private Statement stat;
    private PreparedStatement pstat;
    private ResultSet rs;

    public PlanInfoDAO() {
        try {
        	conn = DBUtil.open("183.100.233.88", "sist2_travel", "java1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    create table TBLPLAN
//            (
//                    PLANSEQ        NUMBER           not null primary key,
//                    STATUS         VARCHAR2(50)     not null check (status in ('0', '1')),
//   NAME           VARCHAR2(200)    not null,
//    DAYSTARTTRAVEL DATE             not null,
//    DAYENDTRAVEL   DATE             not null,
//    WILLSHARE      VARCHAR2(20)     not null check (willShare in ('y', 'n')),
//    WISH           NUMBER default 0 not null,
//    THEME          VARCHAR2(200),
//    ID             VARCHAR2(50)     not null references TBLMEMBER,
//    CITYSEQ        NUMBER references TBLCITY
//)
//private String planseq;
//    private String name;
//    private String daystarttravel;
//    private String dayendtravel;
//    private String willshare;
//    private String wish;
//    private String theme;
//    private String id;
//    private String cityseq;

    public int add(PlanInfoDTO dto, String memberid) { //일정 설정 완료(plan.jsp) -> 음식점 명소 planseq 참조

        try{
            String sql = "insert into tblPlan (planseq, status, name, daystarttravel, dayendtravel, willshare," +
                    "wish, theme, id, cityseq) values (seqPlan.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstat = conn.prepareStatement(sql);

            //pstat.setString(1, dto.getPlanseq()); //우리가 필요한
            pstat.setString(1, "0");//status
            pstat.setString(2, dto.getName());//거
            pstat.setString(3, dto.getDaystarttravel());
            pstat.setString(4, dto.getDayendtravel());
            pstat.setString(5, dto.getWillshare());//willshare
            pstat.setString(6, "0");//wish
            pstat.setString(7, "");//theme
            pstat.setString(8, memberid);//id
            pstat.setString(9, dto.getCityseq());

            pstat.executeUpdate();
            //정처기 로킹이게 걸릴거같은데 병행제어 -> 트랜잭션의 원자성을 보장한다.

            sql = "select max(planseq) as planseq from tblPlan";
            stat = conn.createStatement();
            rs = stat.executeQuery(sql);
            int planseq = -1;
            if(rs.next()){
                planseq = rs.getInt("planseq");
            } else{

            }
            return planseq;



        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }

//  private String name;
//  private String daystarttravel;
//  private String dayendtravel;
//  private String willshare;
//  private String wish;
//  private String theme;
//  private String id;
//  private String cityseq;
    
    
	public PlanInfoDTO getlist(String planseq) {
		try {
			String sql = "select * from tblPlan where planseq = ?"; // todo:일정번호로 바꿔야함
	
	        pstat = conn.prepareStatement(sql);
	        pstat.setString(1, planseq);
	
	        rs = pstat.executeQuery(); //복붙

	
	        PlanInfoDTO dto = new PlanInfoDTO();
	        if(rs.next()) {
	        	dto.setPlanseq(rs.getString("planseq"));
	        	dto.setName(rs.getString("name"));
	        	dto.setDaystarttravel(rs.getString("daystarttravel"));
	        	dto.setDayendtravel(rs.getString("dayendtravel"));
	        	dto.setWillshare(rs.getString("willshare"));
	        	dto.setTheme(rs.getString("theme"));
	        	dto.setId(rs.getString("id"));
				dto.setCityseq(rs.getString("cityseq"));

	        }//end while
	
	        return dto;
		} catch (Exception e) {
        e.printStackTrace();
    }
    return null;
	}


}









