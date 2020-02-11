package com.kitri.shop.db.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.kitri.shop.db.domain.Question;

public interface QuestionRepository extends CrudRepository<Question, Long>{

	@Query("SELECT q FROM Question q WHERE id=?1")
	public List<Question> selectQuestionById(Long qid);
	
	@Query("SELECT q FROM Question q WHERE p_id=?1")
	public List<Question> selectQuestionByPid(Long pid);
}
