package purple.domain;

public class ImageFile {
	String filename;
	long filesize;
	String imageurl;
	String imagealign;
	String originalurl;
	String thumburl;
	
	public ImageFile() {}
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public double getFilesize() {
		return filesize;
	}
	
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	public String getImageurl() {
		return imageurl;
	}
	
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	
	public String getImagealign() {
		return imagealign;
	}
	
	public void setImagealign(String imagealign) {
		this.imagealign = imagealign;
	}
	
	public String getOriginalurl() {
		return originalurl;
	}
	
	public void setOriginalurl(String originalurl) {
		this.originalurl = originalurl;
	}
	
	public String getThumburl() {
		return thumburl;
	}
	
	public void setThumburl(String thumburl) {
		this.thumburl = thumburl;
	}
	
}
