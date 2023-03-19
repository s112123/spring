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
import com.spring.app.entity.Product;
import com.spring.app.repository.ProductDao;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class ProductServiceImpl implements ProductService {
	
	Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductService productService;
	@Autowired
	private ServletContext context;	
	
	//전체목록수
	@Override
	public int getTotalProducts() {
		return productDao.countAll();
	}
	
	//전체상품목록
	@Override
	public List<Product> getProducts(Pagenation pagenation) {
		List<Product> products = productDao.selectAll(pagenation);
		return products;
	}
	
	//전체상품목록: 카테고리별
	@Override
	public List<Product> getProductsByCategory(String category) {
		List<Product> products = productDao.selectAllByCategory(category);
		return products;
	}
	
	//상품정보
	@Override
	public Product getProductById(int id) {
		Product product = productDao.selectOneById(id);
		return product;
	}
	
	//상품등록
	@Override
	public void insertProduct(Product product, MultipartFile attachedFile) {
		//이미지 파일 저장
		saveFile(product, attachedFile);
		productDao.insertOne(product);
	}
	
	//상품수정
	@Override
	public void updateProduct(Product product, MultipartFile attachedFile) {
		//수정전 상품 이미지 파일 삭제
		int id = product.getId();
		deleteFile(id);
		
		//수정된 상품 이미지 파일 저장
		saveFile(product, attachedFile);
		
		//상품정보수정
		productDao.updateOne(product);
	}
	
	//파일등록
	private void saveFile(Product product, MultipartFile attachedFile) {
		//업로드 폴더 경로 (rootPath -> D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\app\)
		String uploadDirPath = context.getRealPath("/") + "resources\\images\\products";
		String thumbDirPath = uploadDirPath + File.separator + "thumbnails";
		
		//thumbnails 폴더 없으면 생성 -> thumbnails 폴더는 products 폴더 안에 있으므로 해당 폴더만 있는지 확인하고 없으면 모두 생성 (판매중지 기능이 필요)
		File thumbDir = new File(thumbDirPath);
		if(!thumbDir.exists()) thumbDir.mkdirs();
		
		//이미지 파일인지 검증
		if((attachedFile.getSize() > 0) && (attachedFile.getContentType().startsWith("image"))) {
			
			try {
				//이미지 파일 업로드
				String imgFileName = UUID.randomUUID().toString() + "_" + attachedFile.getOriginalFilename();
				File imgFile = createFile(uploadDirPath, imgFileName);
				attachedFile.transferTo(imgFile);
				
				//썸네일 파일 업로드
                File thumbFile = new File(thumbDir, "thumb_" + imgFileName);
                Thumbnails.of(imgFile).size(80, 130).outputFormat("jpg").toFile(thumbFile);				
				
				//이미지파일 이름 저장
				product.setImg(imgFileName);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else {
			log.info("이미지 파일이 아닙니다");
		}		
	}
	
	//파일삭제
	private void deleteFile(int id) {
		//DB에서 상품조회 -> 수정되기 전 파일이름 추출
		Product product = productService.getProductById(id);
		
		//이미지 파일: 썸네일 파일은 이미 주문된 상품 목록에서는 사용되어야 하므로 유지
		String imgDirPath = context.getRealPath("/") + "resources\\images\\products";
		String imgFileName = product.getImg();
		File imgfile = createFile(imgDirPath, imgFileName);
		
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
