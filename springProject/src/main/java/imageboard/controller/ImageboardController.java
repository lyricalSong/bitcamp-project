package imageboard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.service.ImageboardService;

@Controller
@RequestMapping(value = "imageboard")
public class ImageboardController {
	@Autowired
	private ImageboardService imageboardService;
	
	
	
	// 이미지 등록 페이지
	@RequestMapping(value = "imageboardWriteForm", method = RequestMethod.GET)
	public String imageboardWriteForm(Model model) {

		model.addAttribute("display", "/imageboard/imageboardWriteForm.jsp");
		return "/main/index";
	}

	// 이미지등록
	// name ="img" 1개일 경우
//	@RequestMapping(value="imageboardWrite",method=RequestMethod.POST)
//	@ResponseBody
//	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,@RequestParam MultipartFile img) {
//		String filePath="D:\\spring\\workSTS\\springProject\\src\\main\\webapp\\storage"; //복사 할 가상폴더주소
//		String fileName = img.getOriginalFilename(); //파일 이름은 오리지널이름으로
//		File file = new File(filePath,fileName);
//		
//		//파일복사해서 가상폴더에 집어넣기
//		try {
//			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		//이미지 파일 이름만 DTO에 넣기
//		imageboardDTO.setImage1(fileName);
//		
//	}

	
	/*
	// name="img" 2개 이상일 경우
	@RequestMapping(value = "imageboardWrite", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO, @RequestParam MultipartFile[] img) {
		String filePath = "D:\\spring\\workSTS\\springProject\\src\\main\\webapp\\storage"; // 복사 할 가상폴더주소
		String fileName;
		File file;

		// 파일복사해서 가상폴더에 집어넣기
		if (img[0] != null) {
			fileName = img[0].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}

			// 이미지 파일 이름만 DTO에 넣기
			imageboardDTO.setImage1(fileName);
		} else {
			imageboardDTO.setImage1("");
		}
		//------------------------------------------
		if (img[1] != null) {
			fileName = img[1].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}

			// 이미지 파일 이름만 DTO에 넣기
			imageboardDTO.setImage2(fileName);
		} else {
			imageboardDTO.setImage2("");
		}
		
		//DB
		imageboardService.imageboardWrite(imageboardDTO);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/imageboard/imageboardWrite.jsp");
		mav.setViewName("/main/index");
		return mav;
		
	}*/
	//================================================================================================
		//드래그 해서 한번에 여러개 파일을 선택했을 때 
	/*
	@RequestMapping(value = "imageboardWrite", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO, @RequestParam("img[]") List<MultipartFile> list) {
		String filePath = "D:\\spring\\workSTS\\springProject\\src\\main\\webapp\\storage"; // 복사 할 가상폴더주소
		
		for(MultipartFile img:list) {
			String fileName = img.getOriginalFilename(); //파일 이름은 오리지널이름으로
			File file = new File(filePath,fileName);
			
			//파일복사
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			}catch (IOException e) {
				e.printStackTrace();
			}
			
			//이미지 파일 이름만 DTO에 넣기
			imageboardDTO.setImage1(fileName);
			imageboardDTO.setImage2("");
			
			//DB
			imageboardService.imageboardWrite(imageboardDTO);
		}//for
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/imageboard/imageboardWrite.jsp");
		mav.setViewName("/main/index");
		return mav;
	}*/
	//ajax으로 변환
	@RequestMapping(value="imageboardWrite", method=RequestMethod.POST)
	@ResponseBody
	public void imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
								@RequestParam("img[]") List<MultipartFile> list){
		String filePath = "D:\\spring\\workSTS\\springProject\\src\\main\\webapp\\storage";
		
		for(MultipartFile img : list) {
			String fileName = img.getOriginalFilename();
			File file = new File(filePath, fileName);
			
			//파일 복사
			try {
				FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			imageboardDTO.setImage1(fileName);
			imageboardDTO.setImage2("");

			//DB
			imageboardService.imageboardWrite(imageboardDTO);
		}//for
	}
	
	
	//===========-----------------==============-----------------------================---------------------------------------------------============
	//이미지 보드 리스트
	@RequestMapping(value = "imageboardList", method = RequestMethod.GET)
	public String imageboardList(@RequestParam(required = false, defaultValue = "1")String pg,Model model) {
		
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/imageboard/imageboardList.jsp");
		return "/main/index";
	}
	
	//이미지 리스트 갖고오기
	@RequestMapping(value = "getImageboardList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getImageboardList(@RequestParam String pg,HttpSession session) {
		List<ImageboardDTO> list = imageboardService.getImageboardList(pg);
		
		String memId = (String) session.getAttribute("memId");
		
		
		//페이징 처리
		ImageboardPaging imageboardPaging = imageboardService.imageboardPaging(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imageboardPaging", imageboardPaging);
		mav.addObject("memId", memId);
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//삭제
	@RequestMapping(value="imageboardDelete", method=RequestMethod.GET)
	public String imageboardDelete(@RequestParam String[] check, Model model) {
		imageboardService.imageboardDelete(check);
		
		model.addAttribute("display", "/imageboard/imageboardDelete.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="imageboardView", method=RequestMethod.GET)
	public String imageboardView(@RequestParam String seq,@RequestParam String pg, Model model) {
		
		model.addAttribute("seq", seq);
		model.addAttribute("pg",pg);
		model.addAttribute("display", "/imageboard/imageboardView.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value = "getImageboardView", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getImageboardView(@RequestParam String seq) {
		ImageboardDTO imageboardDTO = imageboardService.getImageboardView(seq);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imageboardDTO",imageboardDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
//============================임시 무한스크롤 체크=============================================
	@RequestMapping(value = "infiniteScroll", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView infiniteScroll(@RequestParam String pg) {
		List<ImageboardDTO> list = imageboardService.infiniteScroll(pg);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "getModalView", method = RequestMethod.POST)
	@ResponseBody
	public ImageboardDTO getModalView(@RequestParam String seq) {
		ImageboardDTO imageboardDTO = imageboardService.getImageboardView(seq);
		
		
		return imageboardDTO;
		
	}
	

}
