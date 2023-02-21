package kr.spring.view;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

// 이미지를 데이터베이스에 보관하기 때문에 바이트배열에 받은 다음 아이디 태그에 표시
@Component
public class ImageView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {

		byte[] file = (byte[]) model.get("imageFile");
		String filename = (String) model.get("filename");

		String ext = filename.substring(filename.lastIndexOf("."));
		if(ext.equalsIgnoreCase(".gif")) {
			ext = "image/gif";
		}else if(ext.equalsIgnoreCase(".png")) {
			ext = "image/png";
		}else {
			ext = "image/jpeg";
		}

		response.setContentType(ext);
		response.setContentLength(file.length);

		String fileName = new String(
				filename.getBytes("utf-8"),"iso-8859-1");	

		response.setHeader("Content-Disposition", 
				"attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		OutputStream out = response.getOutputStream();
		InputStream input = null;
		try {
			input = new ByteArrayInputStream(file);
			IOUtils.copy(input, out);
			out.flush();
		}finally {
			if(out!=null) out.close();
			if(input!=null) input.close();
		}
	}

}