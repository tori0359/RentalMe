package com.me.rentalme.used.model;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.UsedCmtVo;
import com.me.rentalme.model.entity.UsedStoreVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;

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
    //사용자 정보	
	@Override
	public UserVo userInfo(UserVo bean) throws SQLException {
		return sqlSession.selectOne("used.userInfo",bean);
	}
	/**
	* 중고거래 리스트 출력
	* 
	* @param   
	* @return 
	* @author 박재환
	* @exception return("namespace.id명", 파라미터)
	*/
	@Override
	public List<UsedVo> selectAll(UsedVo bean) throws SQLException {
		log.debug("중고거래 리스트 출력...");
		
		return sqlSession.selectList("used.selectAll",bean);
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
	/**
	 * 중고거래 상세
	 * 
	 * @param   
	 * @return 
	 * @author 박재환
	 * @exception return("namespace.id명", 파라미터)
	 */

	@Override
	public UsedVo DetailOne(String usedGdsNo) throws SQLException {
		return (UsedVo) sqlSession.selectOne("used.detailOne", usedGdsNo);
	}
	/**
	 * 중고거래 댓글 불러오기
	 * 
	 * @param   
	 * @return 
	 * @author 박재환
	 * @exception return("namespace.id명", 파라미터)
	 */
	@Override
	public List<UsedCmtVo> selectCmtAll(String usedGdsNo) throws SQLException {
		return sqlSession.selectList("used.seletCmt", usedGdsNo);
	}
	/**
	 * 중고거래 댓글 달기
	 * 
	 * @param   
	 * @return 
	 * @author 박재환
	 * @exception return("namespace.id명", 파라미터)
	 */
	@Override
	public int cmtInsert(UsedCmtVo bean) throws SQLException {
		return sqlSession.insert("used.insertCmt", bean);
	}
	/**
	 * 내 상점물품 불러오기
	 * 
	 * @param   
	 * @return 
	 * @author 박재환
	 * @exception return("namespace.id명", 파라미터)
	 */
	@Override
	public List<UsedVo> mySelectAll(String mbNo) throws SQLException {
		return sqlSession.selectList("used.mySelectAll", mbNo);
	}

	@Override
	public int myStoreCmtInsert(UsedStoreVo bean) throws SQLException {
		return sqlSession.insert("used.storeCmt", bean);
	}

	@Override
	public List<UsedStoreVo> myStoreCmtSelect(String storeNo) throws SQLException {
		return sqlSession.selectList("used.myStoreCmtSelectAll", storeNo);
	}

	@Override
	public int usedcount(UsedVo bean) throws SQLException {
		return sqlSession.selectOne("used.usedcount", bean);
	}

	@Override
	public int delMyStoreListOne(String usedGdsNo) throws SQLException {
		return sqlSession.update("used.myselectDel", usedGdsNo);
	}

	@Override
	public List<UsedVo> mySelectAllAlign(UsedVo bean) throws SQLException {
		return sqlSession.selectList("used.mySelectAllAlign", bean);
	}
	@Override
	public int usedComtDecl(DeclVo bean) throws SQLException {
		return sqlSession.insert("used.usedComtDecl", bean);
	}
	@Override
	public int usedStoreDecl(DeclVo bean) throws SQLException {
		return sqlSession.insert("used.usedStoreDecl", bean);
	}



	
}
