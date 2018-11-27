package com.s360.chatbot.rest.client;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.s360.chatbot.util.Constants;

@Component
public class TataSkyChatBotRestClient {

	public String getReply(String user, String input, String code, String refresh) {

		RestTemplate restTemplate = new RestTemplate();
		String result = null;

		try {
			final StringBuilder uri = new StringBuilder(Constants.TATASKY_URL);
			uri.append("/chat?botname=");
			uri.append(Constants.TATASKY_BOTNAME);
			uri.append("&user=").append(user);
			if (!input.isEmpty() && null != input) {
				uri.append("&input=").append(input);
			}
			if (!code.isEmpty() && null != code) {
				uri.append("&code=").append(code);
			}
			if (!refresh.isEmpty() && null != refresh) {
				uri.append("&refresh=").append(refresh);
			}

			return restTemplate.getForObject(uri.toString(), String.class);

		} catch (RestClientException e) {

		}

		return result;
	}

	public ResponseEntity<String> fileUpload(MultipartFile file) throws IOException {

		RestTemplate restTemplate = new RestTemplate();

		try {
			final StringBuilder serverUrl = new StringBuilder(Constants.TATASKY_URL);
			serverUrl.append("upload");
			FileOutputStream fo;
			String tempFileName;
			String dirPath =   "/home/linux/BrandManagement/chatbot";
			//String dirPath =  "/Users/simplify360/Developement/BrandManagement/chatbot";
			
			File fileDir = new File(dirPath);
			if(! fileDir.isDirectory()) {
				fileDir.mkdirs();
			}
			tempFileName = dirPath + "/"+file.getOriginalFilename();
			fo = new FileOutputStream(tempFileName);
			fo.write(file.getBytes());
			fo.close();
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.MULTIPART_FORM_DATA);

			MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
			body.add("file", new FileSystemResource(tempFileName));

			HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

			ResponseEntity<String> response = restTemplate.postForEntity(serverUrl.toString(), requestEntity,
					String.class);
			return response;

		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;


	}

}
