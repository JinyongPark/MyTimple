package visang.timple.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visang.timple.model.ProjectDTO;

import visang.timple.util.FileManager;


public class ProjectImgController {

	
	@Resource(name="fileManager")
	private FileManager fileManager;
	
	
	
	@RequestMapping(method = { RequestMethod.POST }, value = "/imgupload.vs")
	public String imgupload(ProjectDTO dto, HttpServletRequest req, HttpSession session) {
		//파일 업로드할 폴더 지정하기
		// -> WebContent/files 폴더로 지정
		String root = session.getServletContext().getRealPath("/");
		String path = root + "files"; //경로 (저장서버 진호 알아보는중)
		//System.out.println(path);
		
		//저장할 파일명
		String newFileName = "";
		
		//첨부파일이 있는지?		
		if (!dto.getAttach().isEmpty()) {
			//첨부파일을 서버에 저장하기
			byte[] bytes = null;
			try {
				bytes = dto.getAttach().getBytes();
				//실제 파일 저장 & 저장 파일명 반환
				newFileName = fileManager.doFileUpload(bytes, dto.getAttach().getOriginalFilename(), path);
				//방금 저장한 파일을 dto에 옮겨 담기
				dto.setOrgFileName((dto.getAttach().getOriginalFilename()));    //(dto.getAttach().getOriginalFilename());//X
				dto.setFileName(newFileName);//***저장되는 파일명 
			} catch (Exception e) {
			}
			
			
		}
		
		req.setAttribute("dto", dto);		
		
		return "/projects/projectlist.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
}
