package com.s360.chatbot.rest.client;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Component
public class TataSkyChatBotRestClient {

	public String getReply(String name, Long option) {

		RestTemplate restTemplate = new RestTemplate();
		String result = null;

		try {
			final StringBuilder uri = new StringBuilder("https://devdata.simplify360.com:9443/bmuwapi/chat?");
			uri.append("user=").append(name).append("&input=").append(option);

			result = restTemplate.getForObject(uri.toString(), String.class);
		} catch (RestClientException e) {
			e.printStackTrace();
		}

		return result;
	}

	public Workbook download() {

		RestTemplate restTemplate = new RestTemplate();

		    restTemplate.getMessageConverters().add(
		            new ByteArrayHttpMessageConverter());
		    Workbook workbook = null;
		    HttpHeaders headers = new HttpHeaders();
		    headers.setAccept(Arrays.asList(MediaType.APPLICATION_OCTET_STREAM));

		    HttpEntity<String> entity = new HttpEntity<String>(headers);

		    ResponseEntity<byte[]> response = restTemplate.exchange(
		            "https://devdata.simplify360.com:9443/bmuwapi/configure/download",
		            HttpMethod.GET, entity, byte[].class, "1");
		  //Create input stream from byte array
		    ByteArrayInputStream bin = new ByteArrayInputStream(response.getBody());

		    //Create workbook object from byte input stream
		    try {
				workbook = new XSSFWorkbook(bin);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		return workbook;
	}
}
