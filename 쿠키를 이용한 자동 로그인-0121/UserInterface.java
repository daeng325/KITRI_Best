//사용자의 로그인 요청이 들어올때마다 로그인이 되었는지 판단하는 인터셉터
//자동 로그인 관련 코드까지 포함

public class UserInterceptor extends HandlerInterceptorAdapter{
	private Logger log = Logger.getLogger(this.getClass());

	@Inject
	UserService userService;
	//데이터베이스에 접근하기 위해 UserService 선언
	//inject 어노테이션은 데이터의 자동 주입을 위한 것
	@Override
	public boolean preHandle(HttpServletRequest request,
		HttpServletResponse response,
		Object handler) throws Exception{
		try
		{
			if(request.getSession().getAttribute("loginInfo") == null)
				//만약 로그인 상태가 아니라면 다음 실행
			{
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				// 세션정보가 없으면 로그인 쿠키가 있는지 정보 확인
				if(loginCookie != null)
				{
					HashMap<String, Object> sessionMap = new HashMap<String, Object>();
					sessionMap.put("SESSIONID", loginCookie.getValue());
					//쿠키에서 세션 아이디 꺼냄
					HashMap<String, Object> resultMap = userService.checkUserInfoWithCookie(sessionmap);
					//세션 아이디값을 기준으로 검색하여 로그인 정보 가져옴
					if(resultMap != null)
					//만약 로그인 정보가 있다면
					{
						request.getSession().setAttribute("loginInfo", resultMap);
						request.getSession().setMaxInactiveInterval(60*30);
						//세션 연결의 유효시간 설정
						return true;
					}
				}
			else
			{
				response.sendRedirect(request.getContextPath()+"");
				return false;
			}
		}
	else
	{
		return true;
	}
}
catch (Exception e)
{
	e.printStackTrace();
}
return super.preHandle(request, response, handler);
}