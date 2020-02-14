package com.kitri.shop.db.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.shop.db.domain.Member;
import com.kitri.shop.db.domain.Order;
import com.kitri.shop.db.domain.Product;
import com.kitri.shop.db.domain.Review;
import com.kitri.shop.db.repository.OrderRepository;
import com.kitri.shop.db.repository.ProductRepository;
import com.kitri.shop.db.repository.ReviewRepository;

@Service
public class ReviewService {
	
	@Autowired
	MemberService mService;
	@Autowired
	ProductRepository proRepo;
	@Autowired
	OrderRepository orderRepo;
	@Autowired
	ReviewRepository reviewRepo;



	public ModelAndView reviewForm(long pid, String username) throws Exception {
		ModelAndView mov = new ModelAndView();
		Member member = mService.findByUid(username).get();
		Product product = proRepo.findProductDetail(pid);
		
		mov.addObject("member", member);
		mov.addObject("product", product);
		
		
		// 해당 member의 구매 목록 가져옴
		List<Order> orders = orderRepo.selectOrderByUid(member.getId().toString());
		System.out.println(orders.size());
		
		// 구매 목록 없다면 리뷰 쓸 수 없음
		if(orders.isEmpty()) {
			// 수정해야함 - 구매한 사람만 리뷰 가능
			mov.setViewName("redirect:/main");
			return mov;				
		}
		
		// 있다면 최신 구매 내역만 가져옴
		Order order = orders.get(0);
		
		// 현재 상품이 최신 구매한 상품이 아니라면 쓸 수 없음
		if(order.getP_id() != pid) {
			// 수정 해야함 - 최신 주문 상품만 리뷰 가능
			mov.setViewName("redirect:/main");
			return mov;
		}
		// 현재 상품이 최신 구매한 상품이지만 이미 리뷰를 썼다면 쓸 수 없음
		if(reviewRepo.selectReviewByOid(order.getId()) != null) {
			mov.setViewName("redirect:/main");
			return mov;			
		}
		
		
		mov.addObject("order", order);
		mov.setViewName("reviewuploadform");
		
		return mov;
	}
	
	public List<Review> prouctsReviews(long p_id){
		List<Review> reviews = new ArrayList<Review>();
		List<Order> oders = orderRepo.returnOrderID(p_id);
		
		if(oders.isEmpty()) {
			return reviews;
		}
		
		for(int i=0;i<oders.size();i++) {
			reviews.add(reviewRepo.selectReviewByOid(oders.get(i).getId()));
		}	
		return reviews;
	}


	
	public Review setReview(Review review, MultipartFile image1, MultipartFile image2,
			MultipartFile image3) throws IOException {		
		
		if(!image1.isEmpty()) {
			byte[] byteImage1 = org.apache.commons.codec.binary.Base64.encodeBase64(image1.getBytes());
			String encodedImage1 = new String(byteImage1);
			review.setImage_1(encodedImage1);
		}
		if(!image2.isEmpty()) {
			byte[] byteImage2 = org.apache.commons.codec.binary.Base64.encodeBase64(image2.getBytes());
			String encodedImage2 = new String(byteImage2);			
			review.setImage_2(encodedImage2);
		}
		if(!image3.isEmpty()) {
			byte[] byteImage3 = org.apache.commons.codec.binary.Base64.encodeBase64(image3.getBytes());
			String encodedImage3 = new String(byteImage3);
			review.setImage_3(encodedImage3);	
		}
		
		review.setRev_agv((review.getRev_price() + review.getRev_quality() + review.getRev_ship())/3.0);
		review.setExt_1(image1.getOriginalFilename().substring(image1.getOriginalFilename().lastIndexOf(".")+1));
		review.setExt_2(image2.getOriginalFilename().substring(image2.getOriginalFilename().lastIndexOf(".")+1));	
		review.setExt_3(image3.getOriginalFilename().substring(image3.getOriginalFilename().lastIndexOf(".")+1));	
		return review;
	}

	public void insertReview(Review review) {
		reviewRepo.save(review);
		
	}

	public boolean isExistReview(long oid) {
		
		return reviewRepo.selectReviewByOid(oid)!=null;
	}

	public Review selectReviewByOid(Long oid) {
		return reviewRepo.selectReviewByOid(oid);
	}

	public Review selectReviewByRid(Long rid) {
		return reviewRepo.selectReviewByRid(rid);
	}
	
}
