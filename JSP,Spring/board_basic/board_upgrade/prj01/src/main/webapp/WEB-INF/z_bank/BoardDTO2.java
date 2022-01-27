package com.naver.erp;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO2 {
	
	private int b_no;
	private String subject;
	private String writer;
	private String reg_date;
	private int readcount;
	private String content;
	
	private String pic;

	private String pwd;
	private String email;
	private int group_no;
	private int print_no;
	private int print_level;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public int getPrint_no() {
		return print_no;
	}
	public void setPrint_no(int print_no) {
		this.print_no = print_no;
	}
	public int getPrint_level() {
		return print_level;
	}
	public void setPrint_level(int print_level) {
		this.print_level = print_level;
	}

	//----------------------------------
	//----------------------------------
	private String pic_old;
	private MultipartFile img;
	//----------------------------------
	public void setNewFileName() {
		if(pic!=null && pic.length()>0) {
			pic_old = pic;
		}
		//------------------------------------------
		//  업로드한 파일의 새로운 이름 정하기
		//------------------------------------------
		// 업로드한 파일의 새 파일명  저장할 변수 선언하기. 파일명에는 확장자가 포함한다.
		// 만약 업로드된 파일이 있으면
		if( img!=null && img.isEmpty()==false ){
			// 업로드한 파일의 원래 파일명 얻기. 파일명에는 확장자가 포함한다.
			String oriFileName = img.getOriginalFilename();
			// 업로드한 파일의  파일확장자 얻기
			String file_extension = oriFileName.substring(   oriFileName.lastIndexOf(".")+1      );
			// 고유한 새 파일명 얻기. 파일명에는 파일확장자 포함한다.
			pic = UUID.randomUUID() + "." + file_extension;
		}
	}

	public void upLoadFile(String uploadDir) throws Exception{

		if( img!=null && img.isEmpty()==false ){
			// 새 파일을 생성하기. File 객체를 생성하면 새 파일을 생성할 수 있다.
			File file = new File( uploadDir + pic );
			// 업로드한 파일을 새 파일에 전송하여 덮어쓰기
			img.transferTo(file);
		}
				
	}
	public void deleteFile(String uploadDir) {

		if( img!=null && img.isEmpty()==false ){
			if( pic!=null && pic.length()>0 && pic_old!=null && pic_old.length()>0){
				File file = new File( uploadDir + pic_old );
				file.delete();
			}
		}
				
	}
	
	
	
	
	

	
}
