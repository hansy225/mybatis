package com.mybatis.member.service;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.common.template.Template;
import com.mybatis.member.dao.MemberDao;
import com.mybatis.member.vo.Member;

public class MemberServiceImpl implements MemberService {
	SqlSession sqlSession = Template.getSqlSession();
	private MemberDao mDao = new MemberDao();
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(sqlSession, m);
		sqlSession.close();
		return loginUser;
	}

}
