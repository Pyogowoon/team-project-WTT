package com.prec.faq;

public class FAQVo {
	int sno;
	String fCat;
	String subject;
	String doc;
	
	
	
	@Override
	public String toString() {
		return "FAQVo [sno=" + sno + ", fCat=" + fCat + ", subject=" + subject + ", doc=" + doc + "]";
	}

	public FAQVo() {
		
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getfCat() {
		return fCat;
	}

	public void setfCat(String fCat) {
		this.fCat = fCat;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDoc() {
		return doc;
	}

	public void setDoc(String doc) {
		this.doc = doc;
	}
	
	
}
