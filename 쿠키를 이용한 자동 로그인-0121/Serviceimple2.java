@Override
public HashMap<String, Object> checkUserInfoWithCookie(HashMap<String, Object> map) throws Exception{
	return userDAO.checkUserInfoWithCookie(map);
}

//자동로그인 로직 호출