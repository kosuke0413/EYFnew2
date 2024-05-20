package bean;

import java.io.Serializable;

public class Test implements Serializable{

	private Student student;  // 生徒の情報やぞ

	private School school;    // 学校の情報やわ

	private String classNum;  // クラス番号やな

	private int no;           // テストの番号や

	private int point;        // テストの点数やぞ

	private bean.Subject subject;  // 教科の情報やわ

	// 生徒の情報を取得するメソッドやぞ

	public Student getStudent() {

		return student;

	}

	// 生徒の情報を設定するメソッドや

	public void setStudent(Student student) {

		this.student = student;

	}

	// 学校の情報を取得するメソッドやわ

	public School getSchool() {

		return school;

	}

	// 学校の情報を設定するメソッドや

	public void setSchool(School school) {

		this.school = school;

	}

	// クラス番号を取得するメソッドやな

	public String getClassNum() {

		return classNum;

	}

	// クラス番号を設定するメソッドやぞ

	public void setClassNum(String classNum) {

		this.classNum = classNum;

	}

	// テストの番号を取得するメソッドや

	public int getNo() {

		return no;

	}

	// テストの番号を設定するメソッドやわ

	public void setNo(int no) {

		this.no = no;

	}

	// テストの点数を取得するメソッドやぞ

	public int getPoint() {

		return point;

	}

	// テストの点数を設定するメソッドや

	public void setPoint(int point) {

		this.point = point;

	}

	// 教科の情報を取得するメソッドやわ

	public bean.Subject getSubject() {

		return subject;

	}

	// 教科の情報を設定するメソッドやぞ

	public void setSubject(bean.Subject subject) {

		this.subject = subject;

	}

}