package scoremanager.main;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import bean.Teacher;
import bean.TestListSubject;
import dao.ClassNumDao;
import dao.SubjectDao;
import dao.TestListSubjectDao;
import tool.Action;

public class TestListSubjectExecuteAction extends Action{

	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		//ローカル変数の宣言 1
		HttpSession session = req.getSession();//セッション
		Teacher teacher = (Teacher)session.getAttribute("user");//ログインユーザー

		int entYear;//入学年度
		String classNum = "";//クラス番号
		String subjectCd = "";
		Subject subject = new Subject();//科目
		School school;//学校

		List<TestListSubject> testSublist = null; //検索結果を入れる箱を作成
		TestListSubjectDao TestSubDao = new TestListSubjectDao();//科目検索Dao作成

		LocalDate todaysDate = LocalDate.now();// LcalDateインスタンスを取得
		int year = todaysDate.getYear();// 現在の年を取得
		ClassNumDao cNumDao = new ClassNumDao();// クラス番号Daoを初期化
		SubjectDao subDao = new SubjectDao();   // 科目Daoを初期化
		Map<String, String> errors = new HashMap<>();// エラーメッセージ

		//リクエストパラメータ―の取得 2
		entYear = Integer.parseInt(req.getParameter("ent_year"));//入学年度
		classNum = req.getParameter("class_num");
		subjectCd = req.getParameter("subject_num");

		//ログインユーザーと科目コードをもとにSubjectを取得
		subject = subDao.get(subjectCd,teacher.getSchool());
		//ログインユーザーをもとにSchoolを取得
		school = teacher.getSchool();

		//DBからデータ取得 3
		// ログインユーザーの学校コードをもとにクラス番号の一覧を取得
		List<String> cNumlist = cNumDao.filter(teacher.getSchool());
		//ログインユーザーの学校コードをもとに科目の一覧を取得
		List<Subject> sublist = subDao.filter(teacher.getSchool(),true);


		// リストを初期化
		List<Integer> entYearSet = new ArrayList<>();
		// 10年前から1年後まで年をリストに追加
		for (int i = year - 10; i < year + 1; i++) {
			entYearSet.add(i);
		}

		//TestSubDaoのフィルターでSQL検索抽出
		try{
		testSublist = TestSubDao.Filter(entYear,classNum,subject,school);
		req.setAttribute("sub_name", subject.getName());//検索した科目の名前をセット
		}catch(NullPointerException n){
			errors.put("nullpo2","入学年度とクラスと科目をすべて選択してください");
			req.setAttribute("errors", errors);
		}
		//DBへデータ保存 5
		//なし
		//レスポンス値をセット 6
		// リクエストにデータをセット
		req.setAttribute("ent_year_set", entYearSet); //リクエストに10年前から1年後の入学年度をセット
		req.setAttribute("class_num_set", cNumlist);  //ログインしてる先生の学校のクラス番号をセット
		req.setAttribute("subject_list_set", sublist);//ログインしてる先生の学校の科目名をセット

		// リクエストに学生リストをセット
		req.setAttribute("test_subjects", testSublist);

		req.setAttribute("f1", entYear);
		req.setAttribute("f2", classNum);
		req.setAttribute("f3", subjectCd);



		//JSPへフォワード 7
		req.getRequestDispatcher("test_list_student.jsp").forward(req, res);
	}
}
