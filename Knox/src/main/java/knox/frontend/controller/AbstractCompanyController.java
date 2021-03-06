package knox.frontend.controller;

import knox.frontend.model.DummyData;

import java.util.HashMap;

public abstract class AbstractCompanyController {
  HashMap<Integer, DummyData> ddHash = new HashMap<>();

  public AbstractCompanyController() {
    for (int i = 0; i < 10; i++) {
      DummyData dd = DummyData.CreateDummy(i);
      ddHash.put(dd.getUniqueId(), dd);
    }
  }
}
