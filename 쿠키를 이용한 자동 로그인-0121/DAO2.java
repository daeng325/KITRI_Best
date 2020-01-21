@SuppressWarnings("unchecked")
public HashMap<String, Object> checkUserInfoWithCookie(HashMap<String, Object> map) throws Exception{
	return (HashMap<String, Object>)selectOne("user.checkUserInfoWithCookie", map);
}
//자동로그인 쿼리 호출