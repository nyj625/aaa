package Info;

public class SearchInfo {
	int max = 3;
	Integer pageno = 1;
String select;
String input;
String ids1;
private String searchType;

private String txt;


public SearchInfo() {
	super();
}



public String getSearchType() {
	return searchType;
}



public void setSearchType(String searchType) {
	this.searchType = searchType;
}



public String getTxt() {
	return txt;
}



public void setTxt(String txt) {
	this.txt = txt;
}



public SearchInfo(String searchType,String txt) {
	where=" where "+searchType+" like '%"+txt+"%'";
}

	
	public String getIds1() {
		return ids1;
	}


	public void setIds1(String ids1) {
		this.ids1 = ids1;
	}


	public String getSelect() {
	return select;
}

public void setSelect(String select) {
	this.select = select;
}

public String getInput() {
	return input;
}

public void setInput(String input) {
	this.input = input;
}

	public SearchInfo(String where,boolean canpage) {
		this.where=where;
		setCanPage(canpage);
	}
	public Integer getPageno() {
		return pageno;
	}
	
	public Integer getNext() {
		return pageno+1;
	}
	
	public Integer getPrev() {
		return pageno>1?pageno-1:1;
	}

	public void setPageno(Integer pageno) {
		if (pageno == null || pageno < 1)
			pageno = 1;
		this.pageno = pageno;
		limit = " limit " + (pageno - 1) * max + "," + max;
	}
	
	public void setCanPage(boolean iscan) {
		if(!iscan) limit="";
	}

	String where="";
	String limit=" limit " + (pageno - 1) * max + "," + max;
	

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

}
