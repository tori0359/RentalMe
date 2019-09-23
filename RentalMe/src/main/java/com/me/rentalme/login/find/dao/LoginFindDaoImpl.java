package com.me.rentalme.login.find.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.me.rentalme.model.entity.UserVo;

/**
* 아이디/비밀번호 찾기 Dao
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.28
*/
@Repository
public class LoginFindDaoImpl implements LoginFindDao {
	
	Logger log = LoggerFactory.getLogger(getClass());

	@Inject
	SqlSession sqlSession;
	/**
	* 입력한 이메일이 등록된 이메일인지 체크 (1개이상 : 등록된 아이디, 0개 : 등록된 아이디 x)
	* 
	* @param  String email : 이메일주소
	* @return String 
	* @author 황인준
	* @exception
	*/
	@Override
	public int checkEmail(String email) {
		log.debug("이메일로 아이디 유/무 체크 Dao");
		
		return sqlSession.selectOne("loginFind.checkId", email);
	}
	
	/**
	* 등록된 이메일로 아이디 찾기 - 아이디, 가입일자
	* 
	* @param  String email : 이메일주소
	* @return String 
	* @author 황인준
	* @exception
	*/	
	@Override
	public List<UserVo> getEmailFindId (String email) {
		log.debug("이메일로 아이디 찾기 Dao");

		return sqlSession.selectList("loginFind.getId", email);
	}
	
	/**
	* 등록된 이메일로 비밀번호 찾기 
	* 
	* @param  String userId : 입력한 사용자 아이디 
	* @param  String email  : 입력한 사용자 이메일
	* @return int 
	* @author 황인준
	* @exception
	*/	
	@Override
	public int checkPwEmail(String userId, String email) {
		log.debug("등록된 이메일로 비밀번호 찾기 Dao");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("email", email);
		int result = sqlSession.selectOne("loginFind.checkPwEmail", map);
		return result;
	}
	
	/**
	* 등록된 핸드폰으로 비밀번호 찾기 
	* 
	* @param  String userId : 입력한 사용자 아이디 
	* @param  String hp  : 입력한 사용자 핸드폰번호
	* @return int 
	* @author 황인준
	* 등록일자 : 2019-09-21
	*/
	@Override
	public int checkPwHp(String userId, String hp) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("hp", hp);
		int result =  sqlSession.selectOne("loginFind.checkPwHp", map);
		System.out.println("result : "+result);
		return result;
	}

	/**
	* 비밀번호 변경 
	* 
	* @param  String userPw
	* @return void
	* @author 황인준
	* @exception
	*/
	@Override
	public int updPw(String userPw, String userId, String email) {
		log.debug("비밀번호 변경 Dao");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userPw", userPw);
		map.put("userId", userId);
		map.put("email", email);
		
		return sqlSession.update("loginFind.changePw", map);
		
	}

	/**
	* 등록된 핸드폰의 수신여부 체크 
	* 
	* @param  String hp
	* @return int - 수신동의된 아이디 갯수
	* @author 황인준
	* 등록일자 : 2019-09-09
	*/
	@Override
	public int selectHpYn(String hp) {
	return sqlSession.selectOne("loginFind.hpYnCheck", hp);
	}
	
	/**
	 * 등록된 핸드폰으로 아이디 찾기 
	 * 
	 * @param  String hp : 입력한 핸드폰번호
	 * @return List
	 * @author 황인준
	 * 등록일자 : 2019-09-09
	 */
	@Override
	public List<UserVo> getHpFindId(String hp) {
		//js가 꼬여서 두개로 분리해서 개발 중 추후 하나의 메서드에 분기쳐서 변경할 예정 
		//두개로 분리할 경우 - (코드가 꼬여서 중복으로 실행되는 버그가 있음)
		return sqlSession.selectList("loginFind.hpFindId", hp);
	}
	


}
