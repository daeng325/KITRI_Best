@RequestMapping(value="")
@ResponseBody
public Map<String, Object> login(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception{

	Map<String, Object> loginInfo = userService.selectUserInfo(commandMap.getMap());
	//사용자 정보 조회

	Map<String, Object> resultMap = new HashMap<String, Object>();
	// 요청에 응답하기 위한 (해쉬 형태의 )맵 객체를 생성함

	if(loginInfo == null)
	{
		resultMap.put("status",1);
		resultMap.put("msg","입력하신 정보가 잘못되었거나 존재하지 않는 정보입니다.");
		//사용자 정보가 입력되지 않았거나 존재하지 않는 정보일 경우
	}
	else
	{
		request.getSession().setAttribute("loginInfo", loginInfo);
		request.getSession().setMaxInactiveInterval(60*30*30);
		//로그인 세션을 생성하는 과정(setMax는 세션의 최대 유지 기간이며 밀리초 단위)
		if(commandMap.get("isUseCookie").equals("Y"))
			//로그인 상태 유지 칸이 체크되어 있을 경우
		{
			Cookie cookie = new Cookie("loginCookie", request.getSession().getId());
			//세션에서 얻은 id를 새로 생성한 쿠키에 저장한다
			cookie.setPath("/");
			//쿠키를 찾을 경로를 컨텍스트(프로젝트명) 경로로 변경
			cookie.setMaxAge(60*60*24*7);
			//쿠키의 최대 보관기간을 설정
			response.addCookie(cookie);
			//새로운 쿠키 추가하는 메소드 소환

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("SESSIONID", request.getSession().getId());
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*(60*60*24*7)));
			map.put("SESSIONLIMIT", sessionLimit);
			map.put("loginInfo", loginInfo);
			userService.keepLogin(map);
		}
	resultMap.put("status", 0);
	resultMap.put("msg", "정상적으로 로그인되었습니다.")
	}
	return resultMap;
	}