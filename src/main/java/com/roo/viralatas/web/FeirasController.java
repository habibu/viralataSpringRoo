package com.roo.viralatas.web;
import com.roo.viralatas.domain.Feiras;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/feirases")
@Controller
@RooWebScaffold(path = "feirases", formBackingObject = Feiras.class)
public class FeirasController {
}
