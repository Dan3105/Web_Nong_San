package tad.utility;

import org.springframework.web.multipart.MultipartFile;

public interface ConverterUploadHandler {
	public boolean MoveMultipartToDirectory(MultipartFile fileUpload, String path);
	public String SetImageNameViaMultipartFile(MultipartFile fileUpload);
}
