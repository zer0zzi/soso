package kr.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import kr.spring.interceptor.AdminCheckInterceptor;
import kr.spring.interceptor.AutoLoginCheckInterceptor;
import kr.spring.interceptor.LoginCheckInterceptor;
//import kr.spring.interceptor.WriterCheckInterceptor;

//자바코드 기반 설정 클래스
@Configuration
public class AppConfig implements WebMvcConfigurer{

	private AutoLoginCheckInterceptor autoLogin;
	private LoginCheckInterceptor loginCheck;
	private AdminCheckInterceptor adminCheck;
	//이후에 수정해야 할 부분
	/* private WriterCheckInterceptor writerCheck; */
	
	@Bean
	public AutoLoginCheckInterceptor interceptor() {
		autoLogin = new AutoLoginCheckInterceptor();
		return autoLogin;
	}
	
	@Bean
	public LoginCheckInterceptor interceptor2() {
		loginCheck = new LoginCheckInterceptor();
		return loginCheck;
	}
	
	@Bean
	public AdminCheckInterceptor interceptor3() {
		adminCheck = new AdminCheckInterceptor();
		return adminCheck;
	}
	
	/*
	 * @Bean public WriterCheckInterceptor interceptor4() { writerCheck = new
	 * WriterCheckInterceptor(); return writerCheck; }
	 */
	
	//인터셉터 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//AutoLoginCheckInterceptor 설정
		registry.addInterceptor(autoLogin)
				.addPathPatterns("/**")//포함(root 밑에 모든 경로에 진입 시 자동로그인 체크를 한다.)
				.excludePathPatterns("/member/login.do")//그 모든경로에서 이경로만 배제
				.excludePathPatterns("/member/logout.do");//그 모든경로에서 이경로만 배제
		//LoginCheckInterceptor 설정
		registry.addInterceptor(loginCheck)
				.addPathPatterns("/member/myPage.do")
				.addPathPatterns("/member/update.do")
				.addPathPatterns("/member/changePassword.do")
				.addPathPatterns("/member/delete.do");
				//.addPathPatterns("/board/write.do")
				//.addPathPatterns("/board/update.do")
				//.addPathPatterns("/board/delete.do")
				//.addPathPatterns("/talk/talkRoomWrite.do")
				//.addPathPatterns("/talk/talkList.do")
				//.addPathPatterns("/talk/talkDetail.do")
				//.addPathPatterns("/cart/list.do")
		//AdminCheckInterceptor 설정
		registry.addInterceptor(adminCheck)
				.addPathPatterns("/main/admin.do")
				.addPathPatterns("/member/admin_list.do");
				//.addPathPatterns("/member/admin_update.do")
				//.addPathPatterns("/item/admin_list.do")
				//.addPathPatterns("/item/admin_write.do")
				//.addPathPatterns("/item/admin_modify.do")
		//WriterCheckInterceptor 설정
		//		registry.addInterceptor(writerCheck)
		//		.addPathPatterns("/board/update.do")
		//		.addPathPatterns("/board/delete.do");
	}
	
	//타일스 설정
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer =
				new TilesConfigurer();
		//해당 경로에 xml 설정 파일을 넣음
		configurer.setDefinitions(new String[] {
				"/WEB-INF/tiles-def/main.xml",
				"/WEB-INF/tiles-def/ssy.xml",
				"/WEB-INF/tiles-def/ahnyh123.xml",
				"/WEB-INF/tiles-def/Chaejung97.xml",
				"/WEB-INF/tiles-def/ddongk.xml",
				"/WEB-INF/tiles-def/soon.xml",
				"/WEB-INF/tiles-def/zero.xml",
				"/WEB-INF/tiles-def/yeonh2e.xml"
		});
		configurer.setCheckRefresh(true);
		return configurer;
	}
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver = 
				new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}
}



