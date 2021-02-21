package elk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@RequestMapping("/")
	@ResponseBody
	public String home() {
		return "Hi!!";
	}
	
	@RequestMapping("/auto/kakao/callback")
	@ResponseBody
	public String callback(String test) {
		return "test";
	}
}
