package priv.hailong.jailbreak.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @RequestMapping("/")
    public String getDefault(){
        return "redirect:break";
    }
    @RequestMapping("/break")
    public String getBreak(){
        return "break";
    }
    @RequestMapping("/list")
    public String getList(){return "list";}

}