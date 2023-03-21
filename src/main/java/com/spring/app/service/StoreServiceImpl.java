package com.spring.app.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.app.entity.Pagenation;
import com.spring.app.entity.Store;
import com.spring.app.repository.StoreDao;

@Service
public class StoreServiceImpl implements StoreService {
	
	Logger log = LoggerFactory.getLogger(StoreServiceImpl.class);
	
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private StoreService storeService;
	@Autowired
	private ServletContext context;	
	
	//전체 글 개수
	@Override
	public int getTotalStores() {
		return storeDao.countAll();
	}
	
	//매장목록
	@Override
	public List<Store> getStores(Pagenation pagenation) {
		List<Store> stores = storeDao.selectAll(pagenation);
		return stores;
	}
	
	//매장조회
	@Override
	public Store getStore(int id) {
		Store store = storeDao.selectOne(id);
		return store;
	}
	
	//매장등록
	@Override
	public void insertStore(Store store, MultipartFile attachedFile) {
		//이미지 파일 저장
		saveFile(store, attachedFile);
		storeDao.insertOne(store);
	}
	
	//매장정보수정
	@Override
	public void updateStore(Store store, MultipartFile attachedFile) {
		//기존에 저장된 store 이미지 파일 이름
		Store _store =  storeService.getStore(store.getId());
		String oldFileName = _store.getImg();	
		
		//파일이 비어있으면 첨부파일은 수정을 하지 않은 것이고 파일이 들어있으면 파일수정이 일어남
		if(attachedFile.isEmpty()) {
			//기존 파일이름으로 셋팅
			store.setImg(oldFileName);
		} else {
			//oldFileName 삭제
			deleteFile(oldFileName);
			//새로 첨부된 파일 저장
			saveFile(store, attachedFile);
		}
		
		storeDao.updateOne(store);
	}
	
	//매장삭제
	@Override
	public void deleteStore(int id) {
		Store _store =  storeService.getStore(id);
		String fileName = _store.getImg();
		deleteFile(fileName);
		storeDao.deleteOne(id);
	}	
	
	//파일등록
	private void saveFile(Store store, MultipartFile attachedFile) {
		//업로드 폴더 경로 (rootPath -> D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\app\)
		String uploadDirPath = context.getRealPath("/") + "resources\\images\\stores";
		
		//폴더 생성
		File uploadDir = new File(uploadDirPath);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		
		//이미지 파일인지 검증
		if((attachedFile.getSize() > 0) && (attachedFile.getContentType().startsWith("image"))) {
			try {
				//이미지 파일 업로드
				String imgFileName = UUID.randomUUID().toString() + "_" + attachedFile.getOriginalFilename();
				File imgFile = createFile(uploadDirPath, imgFileName);
				attachedFile.transferTo(imgFile);
	
				//이미지파일 이름 저장
                store.setImg(imgFileName);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else {
			log.info("이미지 파일이 아닙니다");
		}		
	}	

	//파일삭제
	private void deleteFile(String oldFileName) {
		String imgDirPath = context.getRealPath("/") + "resources\\images\\stores";
		File imgfile = createFile(imgDirPath, oldFileName);
		
		//파일삭제
		if(imgfile.exists()) {
			imgfile.delete();
		}			
	}
	
	//파일생성
	private File createFile(String dirPath, String fileName) {
		String filePath = dirPath + File.separator + fileName;
		File file = new File(filePath);
		return file;
	}

}
