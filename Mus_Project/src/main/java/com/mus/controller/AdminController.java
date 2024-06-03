package com.mus.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mus.model.AttachImageVO;
import com.mus.model.ClothVO;
import com.mus.model.Criteria;
import com.mus.model.MemberVO;
import com.mus.model.OrderCancelDTO;
import com.mus.model.OrderDTO;
import com.mus.model.PageDTO;
import com.mus.model.SellerVO;
import com.mus.service.AdminService;
import com.mus.service.OrderService;
import com.mus.service.SellerService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private OrderService orderService;
	
	// 관리자 메인 페이지 이동
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {
		logger.info("관리자 페이지 이동");
	}
	
	/* 상품 관리(상품목록) 페이지 접속 */
	@RequestMapping(value = "goodsManage", method = RequestMethod.GET)
    public void goodsManageGET(Criteria cri, Model model) throws Exception{
        logger.info("상품 관리 페이지 접속");
        
        List list = adminService.goodsGetList(cri);
        System.out.println("list + " + list);
        System.out.println("cri" + cri);
        if(!list.isEmpty()) {
        	model.addAttribute("list", list);
        }else {
        	model.addAttribute("listCheck", "empty");
        	return;
        }
        model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
    }
	
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		logger.info("uploadAjaxActionPOST..........");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}// for		

		String uploadFolder = "C:\\upload";
		
		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {
			
			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				
				multipartFile.transferTo(saveFile);
				
				/* 썸네일 생성(ImageIO) */
				/*
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); 
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);				
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
								
				Graphics2D graphic = bt_image.createGraphics();
				
				graphic.drawImage(bo_image, 0, 0,width,height, null);
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);				
				*/
				
				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
					BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
					
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			
			list.add(vo);
			
		} //for

		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("deleteFile........" + fileName);
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			logger.info("originFileName : " + originFileName);
			file = new File(originFileName);
			file.delete();
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		} // catch
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	/* 상품 정보 수정 */
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(ClothVO vo, RedirectAttributes rttr) {
		logger.info("goodsModifyPOST.........." + vo);
		int result = adminService.goodsModify(vo);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/goodsManage";
	}
	
	/* 상품 정보 삭제 */
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int clothId, RedirectAttributes rttr) {
		logger.info("goodsDeletePOST..........");
		
		List<AttachImageVO> fileList = adminService.getAttachInfo(clothId);
		
		if(fileList != null) {
			List<Path> pathList = new ArrayList();
			fileList.forEach(vo -> {
				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 썸네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
			});
			
			pathList.forEach(path -> {
				path.toFile().delete();
			});
		}
		
		int result = adminService.goodsDelete(clothId);
		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/admin/goodsManage";
	}
	
	/* 상품 등록 페이지 접속 */
	@RequestMapping(value = "goodsEnroll", method = RequestMethod.GET)
    public void goodsEnrollGET(Model model) throws Exception{
        logger.info("상품 등록 페이지 접속");
        
        ObjectMapper objm = new ObjectMapper();
        ClothVO vo = new ClothVO();
        
        List list = adminService.cateList();
        String cateList = objm.writeValueAsString(list);
        model.addAttribute("cateList", cateList);
        
        logger.info("변경 전.........." + list);
		logger.info("변경 후.........." + cateList);
    }
    
	/* 상품 조회 페이지 */
	@GetMapping({"/goodsDetail", "/goodsModify"})
	public void goodsGetInfoGET(int clothId, Criteria cri, Model model) throws JsonProcessingException {
		logger.info("goodsGetInfo()........." + clothId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(clothId));
	}
	
    /* 판매자 등록 페이지 접속 */
    @RequestMapping(value = "sellerEnroll", method = RequestMethod.GET)
    public void sellerEnrollGET() throws Exception{
        logger.info("판매자 등록 페이지 접속");
    }
    
    /* 판매자 관리 페이지 접속 */
    @RequestMapping(value = "sellerManage", method = RequestMethod.GET)
    public void sellerManageGET(Criteria cri, Model model) throws Exception{
    	logger.info("판매자 관리 페이지 접속.........." + cri);
        
        /* 판매자 목록 출력 데이터 */
        List list = sellerService.sellerGetList(cri);
        
        if(!list.isEmpty()) {
        	model.addAttribute("list", list);
        }else {
        	model.addAttribute("listCheck", "empty");
        }
        
        // 페이지 이동 인터페이스 데이터
        int total = sellerService.sellerGetTotal(cri);
        PageDTO pageMaker = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageMaker);
    }
    
    // 판매자 등록
    @RequestMapping(value = "sellerEnroll.do", method = RequestMethod.POST)
    public String sellerEnrollPOST(SellerVO seller, RedirectAttributes rttr) throws Exception {
    	logger.info("sellerEnroll: " + seller);
    	sellerService.sellerEnroll(seller); // 판매자 등록 쿼리 수행
    	rttr.addFlashAttribute("enroll_result", seller.getBrandName());
    	return "redirect:/admin/sellerManage";
    }
    
    // 판매자 상세, 수정 페이지
    @GetMapping({"/sellerDetail", "/sellerModify"})
    public void sellerGetInfoGET(int sellerId, Criteria cri, Model model) throws Exception {
    	logger.info("sellerDetail......." + sellerId);
    	
    	// 판매자 관련 페이지 정보
    	model.addAttribute("cri", cri);
    	
    	// 선택 판매자 정보
    	model.addAttribute("sellerInfo", sellerService.sellerGetDetail(sellerId));
    }
    
    // 판매자 정보 수정
    @PostMapping("/sellerModify")
	public String sellerModifyPOST(SellerVO seller, RedirectAttributes rttr) throws Exception{
		logger.info("sellerModifyPOST......." + seller);
		int result = sellerService.sellerModify(seller);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/sellerManage";
	}
    
    // 판매자 정보 삭제
    @PostMapping("/sellerDelete")
    public String sellerDeletePOST(int sellerId, RedirectAttributes rttr) {
    	logger.info("sellerDeletePOST..........");
    	int result = 0;
    	
    	try {
			result = sellerService.sellerDelete(sellerId);
		} catch (Exception e) {
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/sellerManage";
		}
    	
    	rttr.addFlashAttribute("delete_result", result);
    	
    	return "redirect:/admin/sellerManage";
    }
    
    // 상품 등록
    @PostMapping("/goodsEnroll")
    public String goodsEnrollPOST(ClothVO cloth, RedirectAttributes rttr) {
    	logger.info("goodsEnrollPOST......" + cloth);
    	
    	if (cloth.getBrandName() == null) {
            cloth.setBrandName("Default Brand"); // 기본 값 설정
        }
    	
    	adminService.clothEnroll(cloth);
    	rttr.addFlashAttribute("enroll_result", cloth.getClothName());
    	return "redirect:/admin/goodsManage";
    }
    
    // 판매자 검색 팝업창
    @GetMapping("/sellerPop")
    public void sellerPopGET(Criteria cri, Model model) throws Exception {
    	logger.info("sellerPopGET.......");
    	
    	cri.setAmount(5);
    	
    	/* 게시물 출력 데이터 */
    	List list = sellerService.sellerGetList(cri);
    	
    	if(!list.isEmpty()) {
    		model.addAttribute("list", list); // 판매자 존재 경우
    	}else {
    		model.addAttribute("listCheck", "empty"); // 판매자 존재하지 않을 경우
    	}
    	
    	/* 페이지 이동 인터페이스 데이터 */
    	model.addAttribute("pageMaker", new PageDTO(cri, sellerService.sellerGetTotal(cri)));
    }
    
    // 회원 관리 페이지 접속
    @RequestMapping(value = "memberManage", method = RequestMethod.GET)
    public void membersManageGET(Criteria cri, Model model) throws Exception {
        logger.info("회원 관리 페이지 접속");
        
        List<MemberVO> memberList = adminService.membersGetList(cri);
        
        if (!memberList.isEmpty()) {
            model.addAttribute("memberList", memberList);
        } else {
            model.addAttribute("memberListCheck", "empty");
        }
        
        model.addAttribute("pageMaker", new PageDTO(cri, adminService.membersGetTotal(cri)));
    }
    
    // 회원 정보 수정
    @PostMapping("/memberModify")
	public String memberModifyPOST(MemberVO vo, RedirectAttributes rttr) {
		logger.info("memberModifyPOST.........." + vo);
		int result = adminService.memberModify(vo);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/memberManage";
	}
    
    /* 회원 조회 페이지 */
	@GetMapping({"/memberDetail", "/memberModify"})
	public void memberGetInfoGET(String memberId, Criteria cri, Model model) throws JsonProcessingException {
		logger.info("goodsGetInfo()........." + memberId);		
		
		model.addAttribute("cri", cri);
		
		model.addAttribute("memberInfo", adminService.memberGetDetail(memberId));
	}
    
    // 회원 삭제
    @PostMapping("/memberDelete")
	public String memberDeletePOST(String memberId, RedirectAttributes rttr) {
		logger.info("memberDeletePOST..........");
		
		int result = adminService.memberDelete(memberId);
		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/admin/memberManage";
	}
    
    /* 이메일 인증 */
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheckGET(String email) throws Exception {
    	/* 뷰(View)로부너 넘어온 데이터 확인 */
	    logger.info("이메일 데이터 전송 확인");
	    logger.info("인증번호 : " + email);
	      
	    /* 인증번호(난수) 생성*/
	    Random random = new Random();
	    int checkNum = random.nextInt(888888) + 111111;
	    logger.info("인증번호 " + checkNum);
	      
	    /* 이메일 보내기 */
	    String setFrom = "kmcsandaetg@gmail.com";
	    String toMail = email;
	    String title = "회원가입 인증 이메일입니다.";
	    String content = 
	          "홈페이지를 방문해 주셔서 감사합니다." +
	          "<br><br>" +
	          "인증 번호는" + checkNum + "입니다." +
	          "<br>" + 
	          "해당 인증 번호를 인증번호 확인란에 기입하여 주세요.";

	      String num = Integer.toString(checkNum);
	      return num;
    }
    
    /* 주문 현황 페이지 */
	@GetMapping("/orderList")
	public String orderListGET(Criteria cri, Model model) {

		List<OrderDTO> list = adminService.getOrderList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, adminService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		return "/admin/orderList";
	}
	
	/* 주문삭제 */
	@PostMapping("/orderCancle")
	public String orderCanclePOST(OrderCancelDTO dto) {
		
		orderService.orderCancle(dto);
		
		return "redirect:/admin/orderList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount() + "&pageNum=" + dto.getPageNum();
	}
}


