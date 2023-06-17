package edu.kh.justgo.myPage.model.exception;

public class FileUploadException extends RuntimeException {

	public FileUploadException() {
		super("파일 업로드에 실패했습니다.");
	}
}
