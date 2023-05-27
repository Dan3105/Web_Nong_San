package tad.utility;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class ConvertUploadHandlerBehaviour implements ConverterUploadHandler {

	@Override
	public boolean MoveMultipartToDirectory(MultipartFile fileUpload, String path) {
		// TODO Auto-generated method stub
		String imageName = fileUpload.getOriginalFilename();
		String pathDir = String.format("%s%s", path, imageName);
		if (!fileUpload.isEmpty()) {
			try {
				File file = new File(pathDir);
				if (file.exists()) {
					file.delete();
				}
				fileUpload.transferTo(file);
				Thread.sleep(3000);
				return true;
			} catch (Exception ex) {
				System.out.println(ex);
			}
		}

		return false;
	}

	@Override
	public String SetImageNameViaMultipartFile(MultipartFile fileUpload) {
		// TODO Auto-generated method stub
		return fileUpload.getOriginalFilename();
	}

}
