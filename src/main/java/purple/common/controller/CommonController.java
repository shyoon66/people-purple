package purple.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import purple.command.CommandMap;
import purple.common.service.CommonService;
import purple.domain.ImageFile;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping(value = "/image", method = RequestMethod.GET)
	public String Image(CommandMap commandMap, Model model) {
		return "common/image";
	}
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public @ResponseBody ImageFile uploadImage(@RequestParam("file") MultipartFile file, CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {	
    	// 이미지 파일인지 체크
		String filename_extension = file.getOriginalFilename().split("\\.")[1];
    	String content_type = file.getContentType();
    	long imageSize = file.getSize();
    	commonService.validImageFile(filename_extension, content_type, imageSize);
    	
    	// 이미지 파일 업로드
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		String attach_path = "resources/upload_image/";
		String rename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        String upload_path = root_path + "/" + attach_path + rename;
        String imageUrl = attach_path + rename;
        
        ImageFile imageFile = commonService.uploadImageFile(file, upload_path, imageUrl);
		
        return imageFile;
	}
}
