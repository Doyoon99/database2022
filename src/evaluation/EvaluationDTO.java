package evaluation;

public class EvaluationDTO {
    int evaluationID;
    String userID;
    String movieName;
    String directorName;
    int movieYear;
    String movieDivide;
    String evaluationTitle;
    String evaluationContent;
    String movieStar;
    int likeCount;

    public int getEvaluationID() {
        return evaluationID;
    }

    public void setEvaluationID(int evaluationID) {
        this.evaluationID = evaluationID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getDirectorName() {
        return directorName;
    }

    public void setDirectorName(String directorName) {
        this.directorName = directorName;
    }

    public int getMovieYear() {
        return movieYear;
    }

    public void setMovieYear(int movieYear) {
        this.movieYear = movieYear;
    }

    public String getMovieDivide() {
        return movieDivide;
    }

    public void setMovieDivide(String movieDivide) {
        this.movieDivide = movieDivide;
    }

    public String getEvaluationTitle() {
        return evaluationTitle;
    }

    public void setEvaluationTitle(String evaluationTitle) {
        this.evaluationTitle = evaluationTitle;
    }

    public String getEvaluationContent() {
        return evaluationContent;
    }

    public void setEvaluationContent(String evaluationContent) {
        this.evaluationContent = evaluationContent;
    }

    public String getMovieStar() {
        return movieStar;
    }

    public void setMovieStar(String movieStar) {
        this.movieStar = movieStar;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public EvaluationDTO() {

    }

    public EvaluationDTO(int evaluationID, String userID, String movieName, String directorName, int movieYear, String movieDivide, String evaluationTitle, String evaluationContent, String movieStar, int likeCount) {
        this.evaluationID = evaluationID;
        this.userID = userID;
        this.movieName = movieName;
        this.directorName = directorName;
        this.movieYear = movieYear;
        this.movieDivide = movieDivide;
        this.evaluationTitle = evaluationTitle;
        this.evaluationContent = evaluationContent;
        this.movieStar = movieStar;
        this.likeCount = likeCount;
    }
}
