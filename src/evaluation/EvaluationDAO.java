package evaluation;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EvaluationDAO {
    //글쓰기 함수
    public int write(EvaluationDTO evaluationDTO) {
        String SQL = "INSERT INTO EVALUATION VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, evaluationDTO.getUserID());
            pstmt.setString(2, evaluationDTO.getMovieName());
            pstmt.setString(3, evaluationDTO.getDirectorName());
            pstmt.setInt(4, evaluationDTO.getMovieYear());
            pstmt.setString(5, evaluationDTO.getMovieDivide());
            pstmt.setString(6, evaluationDTO.getEvaluationTitle());
            pstmt.setString(7, evaluationDTO.getEvaluationContent());
            pstmt.setString(8, evaluationDTO.getMovieStar());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1; //데이터베이스 오류
    }

    public int like(String evaluationID) {
        String SQL = "UPDATE EVALUATION SET likeCount = likeCount + 1 WHERE evaluationID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, evaluationID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return -1; //데이터베이스 오류
    }

    //게시글 삭제하는 함수
    public int delete(String evaluationID) {
        String SQL = "DELETE FROM EVALUATION WHERE evaluationID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, evaluationID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return -1; //데이터베이스 오류
    }

    //평가를 작성한 학생 아이디를 구하는 함수
    public int getUserID(String evaluationID) {
        String SQL = "SELECT userID FROM EVALUATION WHERE evaluationID = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(evaluationID));
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
            try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
        }
        return 0;
    }
}