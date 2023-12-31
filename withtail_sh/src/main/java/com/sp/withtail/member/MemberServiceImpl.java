package com.sp.withtail.member;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sp.withtail.common.dao.CommonDAO;
import com.sp.withtail.mail.Mail;
import com.sp.withtail.mail.MailSender;


@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private MailSender mailSender;
	@Override
	public Member loginMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.loginMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		try {

			long memberSeq = dao.selectOne("member.memberSeq");
			dto.setNum(memberSeq);

			// 회원정보 저장
			dao.insertData("member.insertMember", memberSeq);

			dao.insertData("member.insertMember1", dto);
		
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember", userId);


		} catch (Exception e) {
			e.printStackTrace();
		}
 
		return dto;
	}

	@Override
	public Member readMember(long memberIdx) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember2", memberIdx);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Member readMemberByEmail(String email) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMemberByEmail", email);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public void updateMembership(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("member.updateMembership", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		try {
			dao.updateData("member.updateLastLogin", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			/*
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}
			*/

			dao.updateData("member.updateMember", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		try {
			map.put("membership", 0);
			updateMembership(map);

			dao.deleteData("member.deleteMember2", map);
			dao.deleteData("member.deleteMember1", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void generatePwd(Member dto) throws Exception {
		// 10 자리 임시 패스워드 생성
		StringBuilder sb = new StringBuilder();
		Random rd = new Random();
		String s = "!@#$%^&*~-+ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		for (int i = 0; i < 10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n + 1));
		}

		String result;
		result = dto.getUserId() + "님의 새로 발급된 임시 패스워드는 <b>"
				+ sb.toString()
				+ "</b> 입니다.<br>"
				+ "로그인 후 반드시 패스워드를 변경 하시기 바랍니다.";

		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getEmail());

		mail.setSenderEmail("laboe777@gmail.com");
		mail.setSenderName("관리자");
		mail.setSubject("임시 패스워드 발급");
		mail.setContent(result);

		boolean b = mailSender.mailSend(mail);

		if (b) {
			dto.setUserPwd(sb.toString());
			updateMember(dto);
		} else {
			throw new Exception("이메일 전송중 오류가 발생했습니다.");
		}
	}

	@Override
	public Member readMemberByNickname(String nickName) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember1", nickName);


		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void getCoupon(Member dto) throws Exception {
		try {
			
			dao.insertData("member.getCoupon", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
