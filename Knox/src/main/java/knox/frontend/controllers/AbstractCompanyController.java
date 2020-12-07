package knox.frontend.controllers;

import knox.frontend.models.DummyData;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

public  abstract class  AbstractCompanyController  {
    HashMap<Integer, DummyData> ddHash = new HashMap<>();
    abstract void Initiate (ModelAndView modelAndView) ;


    public AbstractCompanyController(){
        for(int i = 0; i<10; i++){
            DummyData dd = DummyData.CreateDummy(i);
            ddHash.put(dd.getUniqueId(), dd);
        }
    }
}
