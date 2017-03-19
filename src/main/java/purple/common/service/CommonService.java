package purple.common.service;

import org.springframework.web.multipart.MultipartFile;

import purple.domain.ImageFile;

public interface CommonService {
	void validImageFile(String filename_extension, String content_type, long imageSize) throws Exception;
	ImageFile uploadImageFile(MultipartFile file, String upload_path, String imageUrl) throws Exception;
}
