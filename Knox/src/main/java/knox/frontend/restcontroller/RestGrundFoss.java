package knox.frontend.restcontroller;

import org.springframework.web.bind.annotation.*;

@RequestMapping("/api")
@RestController
public class RestGrundFoss {

    @PostMapping(value = "/grundfosssearch", consumes = "application/json")
    @ResponseBody
    public String search(@RequestBody String search){
        System.out.println("Working");
        System.out.println(search);


        return "Stuffs n things";
    }
}