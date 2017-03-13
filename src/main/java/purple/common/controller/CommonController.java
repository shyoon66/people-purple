package purple.common.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

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
	public String uploadImage(@RequestParam("file") MultipartFile file, CommandMap commandMap, Model model) {	
		try {       
            byte fileData[] = file.getBytes();
            fos = new FileOutputStream(IMAGE_PATH + "/" + file.getOriginalFilename());          
            fos.write(fileData);   
        } catch(Exception e) {      
            e.printStackTrace();           
        } finally {            
            try {
            	if(fos != null) {
                	fos.close();
                }            	
            } catch(IOException ie) {
            	ie.printStackTrace();
            }
        }
		
		CommandMap cmdMap = new CommandMap();
		cmdMap.put("filename", file.getOriginalFilename());
		Gson gson = new Gson();
		
		model.addAttribute("fileInfo", gson.toJson(cmdMap));
/*		model.addAttribute("file2", file.getName());
		model.addAttribute("file3", file.getName());
		model.addAttribute("file4", file.getName());*/
		return "common/image";
	}
}
