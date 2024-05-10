package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.School;
import bean.Subject;
import bean.TestListSubject;

public class TestListSubjectDao extends Dao{

	//Filterで取得した値をListに格納するメソッド
	private List<TestListSubject> postFilter(ResultSet rSet) throws Exception {
		// リストを初期化
		List<TestListSubject> list = new ArrayList<>();
		String student = "";
		// インスタンスを初期化
		TestListSubject testlistsubject = new TestListSubject();
		Map<Integer, Integer> points = new HashMap<>();

		try {
			// リザルトセットを全件走査
			while(rSet.next()) {


				// 前回と同じ学生が連続した場合（連続してない場合はstudentに何も入っていない）
				if(student.equals(rSet.getString("student_no"))) {

					// pointsに何回目かとその点数をputする（ない場合は-）
					points.put(rSet.getInt("no"), rSet.getInt("point"));
					testlistsubject.setPoints(points);

				// 前回と違う学生が来た場合
				} else {

					// ループが初回じゃない場合
					if(!(student.equals(""))) {
						// リストに追加
						list.add(testlistsubject);
					}

					// 初期値をセット
					testlistsubject = new TestListSubject();
					points = new HashMap<>();

					// 学生インスタンスに検索結果をセット
					testlistsubject.setEntYear(rSet.getInt("ent_year"));
					testlistsubject.setStudentNo(rSet.getString("student_no"));
					testlistsubject.setStudentName(rSet.getString("name"));
					testlistsubject.setClassNum(rSet.getString("class_num"));
					points.put(rSet.getInt("no"), rSet.getInt("point"));
					testlistsubject.setPoints(points);

					// 学生情報を更新
					student = rSet.getString("student_no");

				}

			}

			//リストに追加
			list.add(testlistsubject);

		} catch (SQLException | NullPointerException e){
			e.printStackTrace();
		}
		return list;
	}

	public List<TestListSubject>  Filter(int entYear,String classNum,Subject subject,School school) throws Exception{
		//リストを初期化
	    List<TestListSubject> list = new ArrayList<>();
	    //コネクションを確立
	    Connection connection = getConnection();
	    //プリペアードステートメント
	    PreparedStatement statement = null;
	    //リザルトセット
	    ResultSet rSet = null;
	    //SQL文のソート
	    //String order = " order by no asc";

	    try {
		    //プリペアードステートメントにSQL文をセット
		    statement = connection. prepareStatement ("SELECT s.ent_year, s.class_num, t.student_no, s.name, t.no, t.point FROM STUDENT s JOIN TEST t ON s.NO = t.STUDENT_NO AND s.CLASS_NUM = t.CLASS_NUM WHERE t.school_cd = ? AND s.ENT_YEAR = ? AND s.CLASS_NUM = ? AND t.SUBJECT_CD = ? ORDER BY s.no ASC,t.no ASC");
		    //プリペアードステートメントに学校コードをバインド
		    statement. setString(1,school.getCd() );
		    statement. setInt(2, entYear);
		    statement. setString(3, classNum);
		    statement. setString(4,subject.getCd() );

		    // プライベートステートメントを実行
		    rSet = statement.executeQuery ();
		    list = postFilter(rSet);
		} catch (Exception e) {
			throw e;
		} finally {
			//
			if(statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}

			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}
		//listを返す
		return list;
	}
}
