package com.timesheet.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploaderHelper {
//	public final String path = "/Home/ess-lt-j4mycl3/Desktop";
	public final String path = new ClassPathResource("static/images/").getFile().getAbsolutePath();
//	public final String path = new ClassPathResource("static/images/").getFile().getAbsolutePath();

	public FileUploaderHelper() throws IOException {
	}

	public boolean uploadFile(MultipartFile file) {
		boolean f = false;
		try {
			/*
			 * old code to write file InputStream is = file.getInputStream(); byte[] data =
			 * new byte[is.available()]; is.read(data);
			 * 
			 * FileOutputStream ios = new FileOutputStream(path + File.separator +
			 * file.getOriginalFilename()); ios.write(data); ios.flush(); ios.close();
			 * is.close();
			 */
			Files.copy(file.getInputStream(), Path.of(path + File.separator + file.getOriginalFilename()),
					StandardCopyOption.REPLACE_EXISTING);
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

//	@Bean(name = "multipartResolver")
//	public CommonsMultipartResolver multipartResolver() {
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//		multipartResolver.setMaxUploadSize(1000000000);
//		return multipartResolver;
//	}
}