package com.prec.user;

public class UserVo {

		private String email;
		private String pwd;
		private String uName;
		private String phone;
		private String nick;
		private int paychk;//23일 추가
		private String payday;//23일 추가
		
		public int getPaychk() {
			return paychk;
		}
		public void setPaychk(int paychk) {
			this.paychk = paychk;
		}
		public String getPayday() {
			return payday;
		}
		public void setPayday(String payday) {
			this.payday = payday;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPwd() {
			return pwd;
		}
		public void setPwd(String pwd) {
			this.pwd = pwd;
		}
		public String getuName() {
			return uName;
		}
		public void setuName(String uName) {
			this.uName = uName;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getNick() {
			return nick;
		}
		public void setNick(String nick) {
			this.nick = nick;
		}
		
		
		
}