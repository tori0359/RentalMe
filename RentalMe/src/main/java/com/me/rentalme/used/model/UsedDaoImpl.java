package com.me.rentalme.used.model;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.UsedVo;

/**
* 중고거래 Dao
* 
* @author 박재환
* @version ver1.0
* @see 
*/
@Repository
public class UsedDaoImpl implements UsedDao {

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	SqlSession sqlSession;
	
	/**
	* 중고거래 리스트 출력
	* 
	* @param   
	* @return 
	* @author 박재환
	* @exception return("namespace.id명", 파라미터)
	*/
	@Override
	public List<UsedVo> selectAll() throws SQLException {
		log.debug("중고거래 리스트 출력...");
		
		return sqlSession.selectList("used.selectAll");
	}
	
	/**
	* 중고거래 탭에 따른 출력(대형가전, 중형가전...)
	* 
	* @param   
	* @return 
	* @author 박재환
	* @exception return("namespace.id명")
	*/
	@Override
	public List<UsedVo> selectOne(UsedVo bean) throws SQLException {
		log.debug("중고거래 탭에 따른 출력(대형가전, 중형가전...)");
		return sqlSession.selectList("used.selectOne",bean);
	}
	
	/**
	* 시퀀스 1증가
	* 
	* @param   
	* @return 
	* @author 박재환
	* @exception return("namespace.id명")
	*/
	@Override
	public int seqInsert() throws SQLException {
		log.debug("시퀀스 1증가...");
		
		return sqlSession.insert("used.seqInsert");
	}

	/**
	 * 중고거래 입력
	 * 
	 * @param   
	 * @return 
	 * @author 박재환
	 * @exception return("namespace.id명", 파라미터)
	 */
	@Override
	public int InsertOne(UsedVo bean) throws SQLException {
		log.debug("중고거래 입력...");
		
		return sqlSession.insert("used.insertOne", bean);
	}



	
}
