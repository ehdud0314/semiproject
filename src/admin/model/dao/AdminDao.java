package admin.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import admin.model.vo.Grade;
import admin.model.vo.Admin;
import board.model.vo.Board;
import member.model.vo.Member;

public class AdminDao {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getAdminCount(Connection conn) {
		int cnt = 0;
		String sql = "SELECT COUNT(*) FROM ADMINBOARD";

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public List<Admin> getAdminByPage(Connection conn, int startRnum, int endRnum) {
		List<Admin> list = null;
		String sql_1 = "(SELECT * FROM ADMINBOARD ORDER BY ADMDATE DESC) D";

		String sql = "SELECT ADMNO, ADMSUBJECT, ADMCONTENT,TO_CHAR(ADMDATE, 'yyyy-mm-dd hh24:mi:ss') AS admdate, ID FROM " + " (SELECT ROWNUM R, D.* FROM " + sql_1 + " ) " + " WHERE R >= ? AND R <= ?";

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRnum);
			pstmt.setInt(2, endRnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Admin>();
				do {
					Admin vo = new Admin();
					vo.setAdmno(rs.getInt("admno"));
					vo.setAdmsubject(rs.getString("admsubject"));
					vo.setAdmcontent(rs.getString("admcontent"));
					vo.setAdmdate(rs.getTimestamp("admdate"));
					vo.setId(rs.getString("id"));
					list.add(vo);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public Admin adminRead(Connection conn, Admin vo) {

		Admin resultVo = null;
		String sql = "SELECT * FROM ADMINBOARD WHERE ADMNO= ?";
		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAdmno());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				resultVo = new Admin();
				resultVo.setAdmno(rs.getInt("admno"));
				resultVo.setAdmsubject(rs.getString("admsubject"));
				resultVo.setAdmcontent(rs.getString("admcontent"));
				resultVo.setAdmdate(rs.getTimestamp("Admdate"));
				resultVo.setId(rs.getString("id"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return resultVo;
	}
	
	public int adminModify(Connection conn, Admin vo) {
		int result = 0;
		String sql = "UPDATE ADMINBOARD SET ID = ?, ADMSUBJECT = ?, ADMCONTENT = ? WHERE ADMNO = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getAdmsubject());
			pstmt.setString(3, vo.getAdmcontent());
			pstmt.setInt(4, vo.getAdmno());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int adminWrite(Connection conn, Admin vo) {
		int result = 0;
		int max = 1;

		// bno 알아오기
		String sqlMaxAdmno = "SELECT NVL(MAX(ADMNO),0)+1 FROM ADMINBOARD";

		// 원글
		String sql = "INSERT INTO ADMINBOARD VALUES(?, ?, ?, DEFAULT, ?, NULL)";

		pstmt = null;
		rs = null;

		try {
			// Bno를 알아오는 부분
			pstmt = conn.prepareStatement(sqlMaxAdmno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				max = rs.getInt(1);
			} else {
				System.out.println("응?");
				return 0;
			}

			close();

			// 글 작성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, max);
			pstmt.setString(2, vo.getAdmsubject());
			pstmt.setString(3, vo.getAdmcontent());
			pstmt.setString(4, vo.getId());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public int adminDelete(Connection conn, Admin vo) {
		int result = 0;
		String sql = "DELETE FROM ADMINBOARD WHERE ADMNO = ?";
		pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getAdmno());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}
	
	public ArrayList<Member> memberPoint(Connection conn, String search) {
		ArrayList<Member> list = null;
		String sql = "select * from member ";

		if (search == null) {
			sql += " order by mpoint";
		} else {
			sql += " where id like '%" + search + "%' order by mpoint";
		}

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Member>();
				do {
					Member ResultVO = new Member();

					ResultVO.setId(rs.getString("id"));
					ResultVO.setName(rs.getString("name"));
					ResultVO.setLocnum(rs.getInt("locnum"));
					ResultVO.setMpoint(rs.getInt("mpoint"));
					ResultVO.setGradeid(rs.getInt("gradeid"));

					list.add(ResultVO);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int gradeUp(Connection conn, Member vo, String id, int mpoint) {
		int gradeid = 0;
		int result = 0;

		String sql = "update member set gradeid = ? where id = ?";

		if (0 <= mpoint && mpoint <= 299) {
			gradeid = 1;
		} else if (300 <= mpoint && mpoint <= 999) {
			gradeid = 2;
		} else if (1000 <= mpoint && mpoint <= 2999) {
			gradeid = 3;
		} else if (3000 <= mpoint && mpoint <= 5999) {
			gradeid = 4;
		} else if (6000 <= mpoint && mpoint <= 9999) {
			gradeid = 5;
		}

		pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gradeid);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close();
		}

		return result;

	}

	public int getMemberCount(Connection conn, String search) {
		int cnt = 0;
		String sql = "SELECT COUNT(*) FROM member";
		if (search != null) {
			sql += " WHERE id LIKE '%" + search + "%'";
		}

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public List<Member> getMemberByPage(Connection conn, int start, int end, String search) {
		List<Member> list = null;
		String sql_1 = "(select * from member ";

		if (search == null) {
			sql_1 += " order by mpoint desc) d";
		} else {
			sql_1 += " where id like '%" + search + "%' order by mpoint desc) d";
		}

		String sql = "SELECT * FROM "
				+ " (SELECT ROWNUM R, D.* FROM " + sql_1  + " ) "
				+ " WHERE R >= ? AND R <= ? ";
		
		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Member>();
				do {
					Member ResultVO = new Member();

					ResultVO.setId(rs.getString("id"));
					ResultVO.setName(rs.getString("name"));
					ResultVO.setLocnum(rs.getInt("locnum"));
					ResultVO.setMpoint(rs.getInt("mpoint"));
					ResultVO.setGradeid(rs.getInt("gradeid"));
					ResultVO.setPhone(rs.getString("phone"));

					list.add(ResultVO);

					System.out.println("list : " + list);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public int memberDelete(Connection conn, Member vo, String id, int phone) {

		int result = 0;
		
		String sql = "delete from member where id = ?";
		
		pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result; 
	}
	
	public ArrayList<Member> memberUser(Connection conn, String search) {
		ArrayList<Member> list = null;
		String sql = "select * from member ";

		if (search == null) {
			sql += " order by id";
		} else {
			sql += " where id like '%" + search + "%' order by i";
		}

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Member>();
				do {
					Member ResultVO = new Member();

					ResultVO.setId(rs.getString("id"));
					ResultVO.setName(rs.getString("name"));
					ResultVO.setLocnum(rs.getInt("locnum"));
					ResultVO.setPhone(rs.getString("phone"));

					list.add(ResultVO);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	
	public List<Grade> getGradeByPage(Connection conn, int start, int end, String search) {
		List<Grade> list = null;
		String sql_1 = "(select m.id, m.name, m.mpoint, g.gradeid, g.gradename from member m, grade g ";

		if (search == null) {
			sql_1 += " where m.gradeid = g.gradeid order by mpoint desc) d";
		} else {
			sql_1 += " where m.gradeid = g.gradeid and id like '%" + search + "%' order by mpoint desc) d";
		}

		String sql = "SELECT * FROM "
				+ " (SELECT ROWNUM R, D.* FROM " + sql_1  + " ) "
				+ " WHERE R >= ? AND R <= ? ";
		
		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<Grade>();
				do {
					Grade gradeVO = new Grade();

					gradeVO.setId(rs.getString("id"));
					gradeVO.setName(rs.getString("name"));
					gradeVO.setMpoint(rs.getInt("mpoint"));
					gradeVO.setGradeId(rs.getInt("gradeid"));
					gradeVO.setGradeName(rs.getString("gradename"));
					list.add(gradeVO);

				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}
	
	public int getGradeCount(Connection conn, String search) {
		int cnt = 0;
		String sql = "SELECT COUNT(*) FROM member m, grade g";
		if (search != null) {
			sql += " WHERE m.gradeid = g.gradeid and id LIKE '%" + search + "%'";
		}

		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
