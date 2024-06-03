package com.mus.controller;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mus.model.TestRequestDto;

@Controller
public class TestPayController {

	ObjectMapper objectMapper = new ObjectMapper();

	@PostMapping("/test")
	public ResponseEntity<String> testApi(@RequestBody TestRequestDto testRequestDto) {
		String responseMsg = testRequestDto.getMsg() + " and Return Response SUCCESS!!";
		return new ResponseEntity<>(responseMsg, HttpStatus.OK);
	}		
	
}
