package com.kitri.shop.db.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kitri.shop.db.domain.Question;

public interface QuestionRepository extends CrudRepository<Question, Long>{

	@Query("SELECT q FROM Question q WHERE id=?1")
	public List<Question> selectQuestionById(Long qid);
	
	@Query("SELECT q FROM Question q WHERE p_id=?1")
	public List<Question> selectQuestionByPid(Long pid);
	
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query("UPDATE Question SET u_id = :#{#question.u_id}, p_id = :#{#question.p_id}, "
			+ "type = :#{#question.type}, title = :#{#question.title}, content = :#{#question.content},"
			+ "ext = :#{#question.ext}, image = :#{#question.image} WHERE id = :#{#question.id}")
	public int updateQuestion(@Param("question") Question question);
}
