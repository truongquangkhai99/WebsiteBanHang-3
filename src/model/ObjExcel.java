package model;

public class ObjExcel {
	String name;
	String classID;
	String khoaID;
	public ObjExcel(String name, String classID, String khoaID) {
		super();
		this.name = name;
		this.classID = classID;
		this.khoaID = khoaID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClassID() {
		return classID;
	}
	public void setClassID(String classID) {
		this.classID = classID;
	}
	public String getKhoaID() {
		return khoaID;
	}
	public void setKhoaID(String khoaID) {
		this.khoaID = khoaID;
	}
	@Override
	public String toString() {
		return "ObjExcel [name=" + name + ", classID=" + classID + ", khoaID=" + khoaID + "]";
	} 
	
}
