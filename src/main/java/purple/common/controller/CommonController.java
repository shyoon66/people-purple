package purple.common.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import purple.common.common.CommandMap;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	static final String IMAGE_PATH = "D:/purple/images";
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	private FileOutputStream fos;
	
	@RequestMapping(value = "/image", method = RequestMethod.GET)
	public String Image(CommandMap commandMap, Model model) {
		return "common/image";
	}
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
	public @ResponseBody CommandMap uploadImage(@RequestParam("file") MultipartFile file, CommandMap commandMap, Model model, HttpServletRequest request) throws IllegalStateException, IOException {	
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		String attach_path = "resources/upload_image/";
		String rename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        String upload_path = root_path + "/" + attach_path + rename;
		
		if(!file.isEmpty()) {
	        file.transferTo(new File(upload_path));
		}
		
		String imageUrl = attach_path + rename;
		logger.debug("@@@@@@@ imageUrl = {}", imageUrl);
		
		CommandMap fileInfoMap = new CommandMap();
		fileInfoMap.put("filename", file.getOriginalFilename());
		fileInfoMap.put("filesize", file.getSize());
		fileInfoMap.put("imageurl", imageUrl);
		fileInfoMap.put("imagealign", "C");
		fileInfoMap.put("originalurl", imageUrl);
		fileInfoMap.put("thumburl", imageUrl);
		
		return fileInfoMap;
	}
}
