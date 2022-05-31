//회원 데이터 모델링

package user;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
    //로그인 함수 : 아이디와 비밀번호를 받아서 로그인 해주는 함수, 결과값은 정수
    public int login(String userID, String userPassword) {
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals(userPassword)) {
                    return 1; //로그인 성공
                }
                else {
                    return 0; //비밀번호 틀림
                }
            }
            return -1; //아이디 없음
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return -2; //데이터베이스 오류
    }

    //회원가입 함수 : 사용자의 정보를 입력받아 회원가입을 실행해주는 함수
    public int join(userDTO user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, false)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserEmail());
            pstmt.setString(4, user.getUserEmailHash());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return -1; //회원가입 실패
    }

    //특정 회원의 이메일 자체를 반환하는 함수 : 사용자의 아이디값을 받아서 사용자의 이메일주소를 반환하는 함수, 결과값은 문자열
    public String getUserEmail(String userID) {
        String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return null; //데이터베이스 오류

    }

    //이메일 검증 함수 : 사용자가 현재 이메일 인증이 되었는지 확인하는 함수
    public boolean getUserEmailChecked(String userID) {
        String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getBoolean(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return false; //데이터베이스 오류
    }

    //특정한 사용자의 이메일 인증을 수행하는 함수
    public boolean setUserEmailChecked(String userID) {
        String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return false; //데이터베이스 오류
    }
}