package com.kitri.shop.db.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.shop.db.domain.Question;
import com.kitri.shop.db.repository.MemberRepository;
import com.kitri.shop.db.repository.ProductRepository;
import com.kitri.shop.db.repository.QuestionRepository;

@Service
public class QuestionService {
	@Autowired
	QuestionRepository qRepo;
	
	@Autowired
	MemberRepository mRepo;
	
	@Autowired
	ProductRepository pRepo;
	
	public Optional<Question> findByQid(Long qid) throws Exception{
		return qRepo.findById(qid);
	}
	
	public List<Question> selectByQid(Long qid){
		return qRepo.selectQuestionById(qid);
	}
	
	public List<Question> selectByPid(Long pid){
		return qRepo.selectQuestionByPid(pid);
	}
	
	public void insertQuestion(Question question) throws Exception{
		qRepo.save(question);
	}
	
	public void updateQuestion(Question question) throws Exception{
		qRepo.updateQuestion(question);
	}
	
	public boolean deleteQuestion(Long qid, String uid) throws Exception{
		// 본인이 작성한 것만 수정 가능
		if(!uid.equals(qRepo.findById(qid).get().getU_id())){
			return false;
		}
		qRepo.deleteById(qid);
		return true;
	}
	
}
