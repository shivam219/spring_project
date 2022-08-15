package com.api.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@RestController
public class ControllerFileUpload {

	@Autowired
	private FileUploaderHelper fileUploaderHelper;

	@PostMapping("/upload-file")
	public ResponseEntity<String> uploadFile(@RequestParam MultipartFile file) {

		if (file.isEmpty()) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("please add file");
		} else if (!file.getContentType().equals("image/jpeg") && !file.getContentType().equals("image/png")) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("file type not supported");
		} else if (fileUploaderHelper.uploadFile(file)) {
			System.out.println(file.getOriginalFilename());
			System.err.println(file.getSize());
			System.err.println(file.getName());
			System.err.println(file.getContentType());
//			return ResponseEntity.ok("File uploaded successfully");
			return ResponseEntity.ok(ServletUriComponentsBuilder.fromCurrentContextPath().path("/image/")
					.path(file.getOriginalFilename()).toUriString());
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error while saving file");
		}
	}
}
