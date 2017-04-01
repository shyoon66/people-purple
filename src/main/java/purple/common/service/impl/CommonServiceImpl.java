package purple.common.service.impl;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import purple.common.controller.CommonController;
import purple.common.service.CommonService;
import purple.domain.ImageFile;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	public void validImageFile(String filename_extension, String content_type, long imageSize) throws Exception {		
		String[] extensionArr = {"jpeg", "jpg", "png", "gif", "JPEG", "JPG", "PNG", "GIF"};
		
		for(int i = 0; i < extensionArr.length; i++) {
			if(!extensionArr[i].equals(filename_extension)) {
				throw new Exception("이미지 파일만 업로드 가능합니다.");
			}
		}
		
		if(imageSize > 20972000) {
			throw new Exception("용량이 20MB 이하만 업로드 가능합니다.");
		}
	}
	
	public ImageFile uploadImageFile(MultipartFile file, String upload_path, String imageUrl) throws Exception {
		if(!file.isEmpty()) {
	        file.transferTo(new File(upload_path));
		}
		
		ImageFile imageFile = new ImageFile();
		
		imageFile.setFilename(file.getOriginalFilename());
		imageFile.setFilesize(file.getSize());
		imageFile.setImageurl(imageUrl);
		imageFile.setImagealign("C");
		imageFile.setOriginalurl(imageUrl);
		imageFile.setThumburl(imageUrl);
		
		return imageFile;
	}
}
